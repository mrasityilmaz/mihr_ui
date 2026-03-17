import 'package:flutter/material.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mihr UI',
      theme: MihrTheme.light(brand: AccentColors.indigo),
      darkTheme: MihrTheme.dark(brand: AccentColors.indigo),
      themeMode: ThemeMode.light,
      home: const _ButtonPreviewPage(),
    );
  }
}

class _ButtonPreviewPage extends StatefulWidget {
  const _ButtonPreviewPage();

  @override
  State<_ButtonPreviewPage> createState() => _ButtonPreviewPageState();
}

class _ButtonPreviewPageState extends State<_ButtonPreviewPage> {
  bool _enabled = true;

  void _noop() {}

  VoidCallback? get _onPressed => _enabled ? _noop : null;

  @override
  Widget build(BuildContext context) {
    final textColors = context.textColors;
    final bgColors = context.bgColors;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColors.brandSolid,
        foregroundColor: textColors.white,
        title: const Text('Button Preview'),
        actions: [
          Row(
            children: [
              Text('Enabled', style: MihrTypography.textSm.medium.copyWith(color: textColors.white)),
              Switch(value: _enabled, onChanged: (v) => setState(() => _enabled = v), activeThumbColor: Colors.white),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: MihrSpacing.insetsX3l,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Primary', _primaryRows()),
            _buildSection('Soft Primary', _softPrimaryRows()),
            _buildSection('Secondary', _secondaryRows()),
            _buildSection('Tertiary', _tertiaryRows()),
            _buildSection('Link (Brand)', _linkBrandRows()),
            _buildSection('Link (Gray)', _linkGrayRows()),
            _buildSection('Destructive (Primary)', _destructiveRows()),
            _buildSection('Destructive (Soft Primary)', _destructiveSoftPrimaryRows()),
            _buildSection('Destructive (Secondary)', _destructiveSecondaryRows()),
            _buildSection('Destructive (Tertiary)', _destructiveTertiaryRows()),
            _buildSection('Destructive (Link)', _destructiveLinkRows()),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> rows) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MihrSpacing.gapVXl,
        Text(title, style: MihrTypography.textLg.semibold.copyWith(color: context.textColors.primary)),
        MihrSpacing.gapVMd,
        ...rows,
        MihrSpacing.gapVXl,
        Divider(color: context.borderColors.secondary),
      ],
    );
  }

  // -- Primary --

  List<Widget> _primaryRows() => [
    _sizeRow(
      sm: MihrPrimaryButton.sm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrPrimaryButton(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrPrimaryButton.lg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrPrimaryButton.xl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
    MihrSpacing.gapVMd,
    _iconRow(
      sm: MihrPrimaryButton.iconSm(onPressed: _onPressed, icon: const Icon(Icons.add)),
      md: MihrPrimaryButton.icon(onPressed: _onPressed, icon: const Icon(Icons.add)),
      lg: MihrPrimaryButton.iconLg(onPressed: _onPressed, icon: const Icon(Icons.add)),
      xl: MihrPrimaryButton.iconXl(onPressed: _onPressed, icon: const Icon(Icons.add)),
    ),
    MihrSpacing.gapVMd,
    _withIconsRow(
      button: MihrPrimaryButton.sm(
        onPressed: _onPressed,
        leadingIcon: const Icon(Icons.check),
        child: const Text('Small Leading'),
      ),
      trailing: MihrPrimaryButton.sm(onPressed: _onPressed, child: const Text('Small Trailing')),
    ),
    MihrSpacing.gapVMd,
    _withIconsRow(
      button: MihrPrimaryButton(
        onPressed: _onPressed,
        leadingIcon: const Icon(Icons.check),
        child: const Text('Leading'),
      ),
      trailing: MihrPrimaryButton(
        onPressed: _onPressed,
        trailingIcon: const Icon(Icons.arrow_forward),
        child: const Text('Trailing'),
      ),
    ),
  ];

  // -- Soft Primary --

  List<Widget> _softPrimaryRows() => [
    _sizeRow(
      sm: MihrSoftPrimaryButton.sm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrSoftPrimaryButton(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrSoftPrimaryButton.lg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrSoftPrimaryButton.xl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
    MihrSpacing.gapVMd,
    _iconRow(
      sm: MihrSoftPrimaryButton.iconSm(onPressed: _onPressed, icon: const Icon(Icons.add)),
      md: MihrSoftPrimaryButton.icon(onPressed: _onPressed, icon: const Icon(Icons.add)),
      lg: MihrSoftPrimaryButton.iconLg(onPressed: _onPressed, icon: const Icon(Icons.add)),
      xl: MihrSoftPrimaryButton.iconXl(onPressed: _onPressed, icon: const Icon(Icons.add)),
    ),
    MihrSpacing.gapVMd,
    _withIconsRow(
      button: MihrSoftPrimaryButton(
        onPressed: _onPressed,
        leadingIcon: const Icon(Icons.check),
        child: const Text('Confirm'),
      ),
      trailing: MihrSoftPrimaryButton(
        onPressed: _onPressed,
        trailingIcon: const Icon(Icons.arrow_forward),
        child: const Text('Continue'),
      ),
    ),
  ];

  // -- Secondary --

  List<Widget> _secondaryRows() => [
    _sizeRow(
      sm: MihrSecondaryButton.sm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrSecondaryButton(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrSecondaryButton.lg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrSecondaryButton.xl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
    MihrSpacing.gapVMd,
    _iconRow(
      sm: MihrSecondaryButton.iconSm(onPressed: _onPressed, icon: const Icon(Icons.add)),
      md: MihrSecondaryButton.icon(onPressed: _onPressed, icon: const Icon(Icons.add)),
      lg: MihrSecondaryButton.iconLg(onPressed: _onPressed, icon: const Icon(Icons.add)),
      xl: MihrSecondaryButton.iconXl(onPressed: _onPressed, icon: const Icon(Icons.add)),
    ),
    MihrSpacing.gapVMd,
    _withIconsRow(
      button: MihrSecondaryButton(
        onPressed: _onPressed,
        leadingIcon: const Icon(Icons.cloud_upload),
        child: const Text('Upload'),
      ),
      trailing: MihrSecondaryButton(
        onPressed: _onPressed,
        trailingIcon: const Icon(Icons.open_in_new),
        child: const Text('Open'),
      ),
    ),
  ];

  // -- Tertiary --

  List<Widget> _tertiaryRows() => [
    _sizeRow(
      sm: MihrTertiaryButton.sm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrTertiaryButton(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrTertiaryButton.lg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrTertiaryButton.xl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
    MihrSpacing.gapVMd,
    _iconRow(
      sm: MihrTertiaryButton.iconSm(onPressed: _onPressed, icon: const Icon(Icons.add)),
      md: MihrTertiaryButton.icon(onPressed: _onPressed, icon: const Icon(Icons.add)),
      lg: MihrTertiaryButton.iconLg(onPressed: _onPressed, icon: const Icon(Icons.add)),
      xl: MihrTertiaryButton.iconXl(onPressed: _onPressed, icon: const Icon(Icons.add)),
    ),
  ];

  // -- Link Brand --

  List<Widget> _linkBrandRows() => [
    _sizeRow(
      sm: MihrLinkButton.sm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrLinkButton(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrLinkButton.lg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrLinkButton.xl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
  ];

  // -- Link Gray --

  List<Widget> _linkGrayRows() => [
    _sizeRow(
      sm: MihrLinkButton.graySm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrLinkButton.gray(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrLinkButton.grayLg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrLinkButton.grayXl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
  ];

  // -- Destructive --

  List<Widget> _destructiveRows() => [
    _sizeRow(
      sm: MihrDestructiveButton.sm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrDestructiveButton(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrDestructiveButton.lg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrDestructiveButton.xl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
    MihrSpacing.gapVMd,
    _iconRow(
      sm: MihrDestructiveButton.iconSm(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      md: MihrDestructiveButton.icon(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      lg: MihrDestructiveButton.iconLg(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      xl: MihrDestructiveButton.iconXl(onPressed: _onPressed, icon: const Icon(Icons.delete)),
    ),
    MihrSpacing.gapVMd,
    _withIconsRow(
      button: MihrDestructiveButton(
        onPressed: _onPressed,
        leadingIcon: const Icon(Icons.warning),
        child: const Text('Delete'),
      ),
      trailing: MihrDestructiveButton(
        onPressed: _onPressed,
        trailingIcon: const Icon(Icons.delete_forever),
        child: const Text('Remove'),
      ),
    ),
  ];

  // -- Destructive Soft Primary --

  List<Widget> _destructiveSoftPrimaryRows() => [
    _sizeRow(
      sm: MihrDestructiveButton.softPrimarySm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrDestructiveButton.softPrimary(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrDestructiveButton.softPrimaryLg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrDestructiveButton.softPrimaryXl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
    MihrSpacing.gapVMd,
    _iconRow(
      sm: MihrDestructiveButton.softPrimaryIconSm(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      md: MihrDestructiveButton.softPrimaryIcon(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      lg: MihrDestructiveButton.softPrimaryIconLg(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      xl: MihrDestructiveButton.softPrimaryIconXl(onPressed: _onPressed, icon: const Icon(Icons.delete)),
    ),
    MihrSpacing.gapVMd,
    _withIconsRow(
      button: MihrDestructiveButton.softPrimary(
        onPressed: _onPressed,
        leadingIcon: const Icon(Icons.warning),
        child: const Text('Delete'),
      ),
      trailing: MihrDestructiveButton.softPrimary(
        onPressed: _onPressed,
        trailingIcon: const Icon(Icons.delete_forever),
        child: const Text('Remove'),
      ),
    ),
  ];

  // -- Destructive Secondary --

  List<Widget> _destructiveSecondaryRows() => [
    _sizeRow(
      sm: MihrDestructiveButton.secondarySm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrDestructiveButton.secondary(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrDestructiveButton.secondaryLg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrDestructiveButton.secondaryXl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
    MihrSpacing.gapVMd,
    _iconRow(
      sm: MihrDestructiveButton.secondaryIconSm(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      md: MihrDestructiveButton.secondaryIcon(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      lg: MihrDestructiveButton.secondaryIconLg(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      xl: MihrDestructiveButton.secondaryIconXl(onPressed: _onPressed, icon: const Icon(Icons.delete)),
    ),
  ];

  // -- Destructive Tertiary --

  List<Widget> _destructiveTertiaryRows() => [
    _sizeRow(
      sm: MihrDestructiveButton.tertiarySm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrDestructiveButton.tertiary(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrDestructiveButton.tertiaryLg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrDestructiveButton.tertiaryXl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
    MihrSpacing.gapVMd,
    _iconRow(
      sm: MihrDestructiveButton.tertiaryIconSm(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      md: MihrDestructiveButton.tertiaryIcon(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      lg: MihrDestructiveButton.tertiaryIconLg(onPressed: _onPressed, icon: const Icon(Icons.delete)),
      xl: MihrDestructiveButton.tertiaryIconXl(onPressed: _onPressed, icon: const Icon(Icons.delete)),
    ),
  ];

  // -- Destructive Link --

  List<Widget> _destructiveLinkRows() => [
    _sizeRow(
      sm: MihrDestructiveButton.linkSm(onPressed: _onPressed, child: const Text('Button SM')),
      md: MihrDestructiveButton.link(onPressed: _onPressed, child: const Text('Button MD')),
      lg: MihrDestructiveButton.linkLg(onPressed: _onPressed, child: const Text('Button LG')),
      xl: MihrDestructiveButton.linkXl(onPressed: _onPressed, child: const Text('Button XL')),
    ),
  ];

  // -- Layout helpers --

  Widget _sizeRow({required Widget sm, required Widget md, required Widget lg, required Widget xl}) {
    return Wrap(
      spacing: MihrSpacing.lg,
      runSpacing: MihrSpacing.md,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [sm, md, lg, xl],
    );
  }

  Widget _iconRow({required Widget sm, required Widget md, required Widget lg, required Widget xl}) {
    return Wrap(
      spacing: MihrSpacing.lg,
      runSpacing: MihrSpacing.md,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [sm, md, lg, xl],
    );
  }

  Widget _withIconsRow({required Widget button, required Widget trailing}) {
    return Wrap(
      spacing: MihrSpacing.lg,
      runSpacing: MihrSpacing.md,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [button, trailing],
    );
  }
}
