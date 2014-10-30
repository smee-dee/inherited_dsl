inherited_dsl
=============

This is a little experiment, how to implement a DSL through a class macro that supports inheritance.

The Problem: 
====

When the super-class uses the dsl macro, it will normally be overwritten, if the sub-class uses the dsl macro, too.

My Trick:
====

Check for Inheritance within the DSL module and propagate the needed dsl variables to the sub-class.
