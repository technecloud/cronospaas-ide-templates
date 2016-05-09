package util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Tool for programmatically constructing SQL select statements. This class aims
 * to simplify the task of juggling commas and SQL keywords when building SQL
 * statements from scratch, but doesn't attempt to do much beyond that. Here are
 * some relatively complex examples:
 * <p>
 * <pre>
 * String sql = new SelectBuilder()
 * .column(&quot;e.id&quot;)
 * .column(&quot;e.name as empname&quot;)
 * .column(&quot;d.name as deptname&quot;)
 * .column(&quot;e.salary&quot;)
 * .from((&quot;Employee e&quot;)
 * .join(&quot;Department d on e.dept_id = d.id&quot;)
 * .where(&quot;e.salary &gt; 100000&quot;)
 * .orderBy(&quot;e.salary desc&quot;)
 * .toString();
 * </pre>
 * <p>
 * <pre>
 * String sql = new SelectBuilder().column(&quot;d.id&quot;).column(&quot;d.name&quot;).column(&quot;sum(e.salary) as total&quot;)
 *         .from(&quot;Department d&quot;).join(&quot;Employee e on e.dept_id = d.id&quot;).groupBy(&quot;d.id&quot;).groupBy(&quot;d.name&quot;)
 *         .having(&quot;total &gt; 1000000&quot;).toString();
 * </pre>
 * <p>
 * Note that the methods can be called in any order. This is handy when a base
 * class wants to create a simple query but allow subclasses to augment it.
 * <p>
 * It's similar to the Squiggle SQL library
 * (http://code.google.com/p/squiggle-sql/), but makes fewer assumptions about
 * the internal structure of the SQL statement, which I think makes for simpler,
 * cleaner code. For example, in Squiggle you would write...
 * <p>
 * <pre>
 * select.addCriteria(new MatchCriteria(orders, &quot;status&quot;, MatchCriteria.EQUALS, &quot;processed&quot;));
 * </pre>
 * <p>
 * With SelectBuilder, we assume you know how to write SQL expressions, so
 * instead you would write...
 * <p>
 * <pre>
 * select.where(&quot;status = 'processed'&quot;);
 * </pre>
 * <p>
 * <p>
 * <pre>
 * String sql = new SelectBuilder(&quot;Employee e&quot;).where(&quot;name like :name&quot;).toString();
 *
 * PreparedStatement ps = new ParameterizedPreparedStatementCreator(sql).setParameter(&quot;name&quot;, &quot;Bob%&quot;)
 *         .createPreparedStatement(conn);
 * </pre>
 *
 * @author John Krasnay <john@krasnay.ca>
 */
public class SelectBuilder extends AbstractSqlBuilder implements Cloneable, Serializable {

	private static final long serialVersionUID = 1;

	private boolean distinct;

	private ArrayList<String> columns = new ArrayList<>(100);

	private ArrayList<String> tables = new ArrayList<>(100);

	private ArrayList<String> joins = new ArrayList<>(100);

	private ArrayList<String> leftJoins = new ArrayList<>(100);

	private ArrayList<String> wheres = new ArrayList<>(100);

	private ArrayList<String> groupBys = new ArrayList<>(100);

	private ArrayList<String> havings = new ArrayList<>(100);

	private ArrayList<SelectBuilder> unions = new ArrayList<>(100);

	private ArrayList<String> orderBys = new ArrayList<>(100);

	private boolean forUpdate;

	private boolean noWait;

	public SelectBuilder() {

	}

	public SelectBuilder(String table) {
		tables.add(table);
	}

	/**
	 * Copy constructor. Used by {@link #clone()}.
	 *
	 * @param other SelectBuilder being cloned.
	 */
	protected SelectBuilder(SelectBuilder other) {

		this.distinct = other.distinct;
		this.forUpdate = other.forUpdate;
		this.noWait = other.noWait;

		this.columns.addAll(other.columns);
		this.tables.addAll(other.tables);
		this.joins.addAll(other.joins);
		this.leftJoins.addAll(other.leftJoins);
		this.wheres.addAll(other.wheres);
		this.groupBys.addAll(other.groupBys);
		this.havings.addAll(other.havings);

		this.unions.addAll(other.unions.stream().map(SelectBuilder::clone).collect(Collectors.toList()));

		this.orderBys.addAll(other.orderBys);
	}

	/**
	 * Alias for {@link #where(String)}.
	 */
	public SelectBuilder and(String expr) {
		return where(expr);
	}

	public SelectBuilder addColumn(String name) {
		columns.add(name);
		return this;
	}

	public SelectBuilder addColumn(String name, boolean groupBy) {
		columns.add(name);
		if (groupBy) {
			groupBys.add(name);
		}
		return this;
	}

	@Override
	public SelectBuilder clone() {
		return new SelectBuilder(this);
	}

	public SelectBuilder distinct() {
		this.distinct = true;
		return this;
	}

	public SelectBuilder forUpdate() {
		forUpdate = true;
		return this;
	}

	public SelectBuilder addTable(String table) {
		tables.add(table);
		return this;
	}

	public List<SelectBuilder> getUnions() {
		return unions;
	}

	public SelectBuilder groupBy(String expr) {
		groupBys.add(expr);
		return this;
	}

	public SelectBuilder having(String expr) {
		havings.add(expr);
		return this;
	}

	public SelectBuilder join(String join) {
		joins.add(join);
		return this;
	}

	public SelectBuilder leftJoin(String join) {
		leftJoins.add(join);
		return this;
	}

	public SelectBuilder noWait() {
		if (!forUpdate) {
			throw new RuntimeException("noWait without forUpdate cannot be called");
		}
		noWait = true;
		return this;
	}

	public SelectBuilder orderBy(String name) {
		orderBys.add(name);
		return this;
	}

	/**
	 * Adds an ORDER BY item with a direction indicator.
	 *
	 * @param name      Name of the column by which to sort.
	 * @param ascending If true, specifies the direction "asc", otherwise, specifies
	 *                  the direction "desc".
	 */
	public SelectBuilder orderBy(String name, boolean ascending) {
		if (ascending) {
			orderBys.add(name + " asc");
		} else {
			orderBys.add(name + " desc");
		}
		return this;
	}

	@Override
	public String toString() {

		StringBuilder sql = new StringBuilder("select ");

		if (distinct) {
			sql.append("distinct ");
		}

		if (columns.size() == 0) {
			sql.append("*");
		} else {
			appendList(sql, columns, "", ", ");
		}

		appendList(sql, tables, " from ", ", ");
		appendList(sql, joins, " join ", " join ");
		appendList(sql, leftJoins, " left join ", " left join ");
		appendList(sql, wheres, " where ", " and ");
		appendList(sql, groupBys, " group by ", ", ");
		appendList(sql, havings, " having ", " and ");
		appendList(sql, unions, " union ", " union ");
		appendList(sql, orderBys, " order by ", ", ");

		if (forUpdate) {
			sql.append(" for update");
			if (noWait) {
				sql.append(" nowait");
			}
		}

		return sql.toString();
	}

	/**
	 * Adds a "union" select builder. The generated SQL will union this query
	 * with the result of the main query. The provided builder must have the
	 * same columns as the parent select builder and must not use "order by" or
	 * "for update".
	 */
	public SelectBuilder union(SelectBuilder unionBuilder) {
		unions.add(unionBuilder);
		return this;
	}

	public SelectBuilder where(String expr) {
		wheres.add(expr);
		return this;
	}

	public List<String> getColumns() {
		return new ArrayList<String>(columns);
	}

	public SelectBuilder removeColumn(String column) {
		columns.remove(column);
		return this;
	}

	public List<String> getTables() {
		return new ArrayList<String>(tables);
	}

	public SelectBuilder removeTable(String table) {
		tables.remove(table);
		return this;
	}

	public void removeWhere(String whereCondition) {
		wheres.remove(whereCondition);
	}

}
