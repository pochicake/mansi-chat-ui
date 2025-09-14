import 'package:flutter/material.dart';
import 'package:mansi/ui/dropdown/dropdown_candidate.dart';

class DropDown extends StatefulWidget {
  final String displayText;
  final List<String> candidates;
  const DropDown({super.key, required this.displayText, required this.candidates});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  OverlayEntry? _overlayEntry;

  void _showCandiates(Offset offset, Size size) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + size.height,
        left: offset.dx,
        child: TapRegion(
          onTapOutside: (event) {
            _hideCandidates();
          },
          child: Theme(
            data: Theme.of(context),
            child: Material(
              elevation: 4,
              clipBehavior: Clip.none,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withValues(alpha: 0.2),
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(widget.candidates.length, (i) => DropDownCandidate(
                    candidate: widget.candidates[i],
                  )),
                ),
              ),
            ),
          ),
        ),
      )
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideCandidates() {
    if (_overlayEntry == null) return;
    _overlayEntry!.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          if (_overlayEntry != null) {
            _hideCandidates();
            return;
          }
          
          final renderbox = context.findRenderObject() as RenderBox;
          _showCandiates(renderbox.localToGlobal(Offset.zero), renderbox.size);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 6,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // display
              Expanded(
                child: Text(
                  widget.displayText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
        
              // const Spacer(),
        
              Icon(
                Icons.arrow_drop_down_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}