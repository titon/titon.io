# Functions #

Like mixins, functions allow for re-use of code. The following functions exist within Toolkit.

## Utility ##

<table class="table is-striped data-table">
    <thead>
        <tr>
            <th>Function</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>black($opacity)</td>
            <td>Output a black background with alpha transparency using <code>rgba()</code>.</td>
        </tr>
        <tr>
            <td>white($opacity)</td>
            <td>Output a white background with alpha transparency using <code>rgba()</code>.</td>
        </tr>
        <tr>
            <td>join-classes($classes, $inherit)</td>
            <td>Join a list of classes (without .) as a CSS selector. If inherit is true, inherit from parent with <code>&</code>.</td>
        </tr>
    </tbody>
</table>

## Grids ##

<table class="table is-striped data-table">
    <thead>
        <tr>
            <th>Function</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>grid-gutter($grid-width, $gutter)</td>
            <td>
                Calculate the gutter margin between columns as a percentage, using the max width of the grid as a base.
                The gutter value supports most unit measurements, or false can be used for no gutter.
            </td>
        </tr>
        <tr>
            <td>grid-span($column, $max-columns, $grid-width, $gutter)</td>
            <td>
                Calculate the width of an individual grid column as a percentage, taking into account the max grid width and gutter.
            </td>
        </tr>
    </tbody>
</table>

## Type Conversion ##

<table class="table is-striped data-table">
    <thead>
        <tr>
            <th>Function</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>strip-unit($value)</td>
            <td>Strip the unit measurement off a value and return the integer.</td>
        </tr>
        <tr>
            <td>to-pixel($from)</td>
            <td rowspan="4">
                Converts from one type of unit measurement to another.
                Conversions use the <code>$base-size</code> variable as a foundation for determining 100% equivalent scaling.
            </td>
        </tr>
        <tr>
            <td>to-percent($from)</td>
        </tr>
        <tr>
            <td>to-rem($from)</td>
        </tr>
        <tr>
            <td>to-em($from)</td>
        </tr>
    </tbody>
</table>