import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';

// Screen for setting meal filters.
class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the active filters from the provider.
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'), // Title of the app bar.
      ),
      body: Column(
        children: [
          // Switch for gluten-free filter.
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!, // Current value of the gluten-free filter.
            onChanged: (isChecked) {
              // Update the gluten-free filter when the switch is toggled.
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free', // Title of the switch.
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.', // Description of the switch.
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary, // Color of the active switch.
            contentPadding: const EdgeInsets.only(left: 34, right: 22), // Padding around the switch.
          ),
          // Switch for lactose-free filter.
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!, // Current value of the lactose-free filter.
            onChanged: (isChecked) {
              // Update the lactose-free filter when the switch is toggled.
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free', // Title of the switch.
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.', // Description of the switch.
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary, // Color of the active switch.
            contentPadding: const EdgeInsets.only(left: 34, right: 22), // Padding around the switch.
          ),
          // Switch for vegetarian filter.
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!, // Current value of the vegetarian filter.
            onChanged: (isChecked) {
              // Update the vegetarian filter when the switch is toggled.
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian', // Title of the switch.
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.', // Description of the switch.
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary, // Color of the active switch.
            contentPadding: const EdgeInsets.only(left: 34, right: 22), // Padding around the switch.
          ),
          // Switch for vegan filter.
          SwitchListTile(
            value: activeFilters[Filter.vegan]!, // Current value of the vegan filter.
            onChanged: (isChecked) {
              // Update the vegan filter when the switch is toggled.
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan', // Title of the switch.
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
            ),
            subtitle: Text(
              'Only include vegan meals.', // Description of the switch.
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary, // Color of the active switch.
            contentPadding: const EdgeInsets.only(left: 34, right: 22), // Padding around the switch.
          ),
        ],
      ),
    );
  }
}