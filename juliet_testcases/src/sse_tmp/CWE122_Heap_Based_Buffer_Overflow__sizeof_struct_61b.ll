; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61b_badSource(%struct._twoIntsStruct* %data) #0 !dbg !19 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !25
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !26
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data.addr, align 8, !dbg !27
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !28
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !34
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !35
  store i32 1, i32* %intOne, align 4, !dbg !36
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !37
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !38
  store i32 2, i32* %intTwo, align 4, !dbg !39
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !40
  ret %struct._twoIntsStruct* %4, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61b_goodG2BSource(%struct._twoIntsStruct* %data) #0 !dbg !42 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !45
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !46
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data.addr, align 8, !dbg !47
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !48
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !54
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 0, !dbg !55
  store i32 1, i32* %intOne, align 4, !dbg !56
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !57
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 1, !dbg !58
  store i32 2, i32* %intTwo, align 4, !dbg !59
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !60
  ret %struct._twoIntsStruct* %4, !dbg !61
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61b_badSource", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61b.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{!4, !4}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !20, line: 21, type: !4)
!24 = !DILocation(line: 21, column: 96, scope: !19)
!25 = !DILocation(line: 25, column: 29, scope: !19)
!26 = !DILocation(line: 25, column: 12, scope: !19)
!27 = !DILocation(line: 25, column: 10, scope: !19)
!28 = !DILocation(line: 26, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 9)
!30 = !DILocation(line: 26, column: 14, scope: !29)
!31 = !DILocation(line: 26, column: 9, scope: !19)
!32 = !DILocation(line: 26, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !20, line: 26, column: 23)
!34 = !DILocation(line: 27, column: 5, scope: !19)
!35 = !DILocation(line: 27, column: 11, scope: !19)
!36 = !DILocation(line: 27, column: 18, scope: !19)
!37 = !DILocation(line: 28, column: 5, scope: !19)
!38 = !DILocation(line: 28, column: 11, scope: !19)
!39 = !DILocation(line: 28, column: 18, scope: !19)
!40 = !DILocation(line: 29, column: 12, scope: !19)
!41 = !DILocation(line: 29, column: 5, scope: !19)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_61b_goodG2BSource", scope: !20, file: !20, line: 37, type: !21, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !20, line: 37, type: !4)
!44 = !DILocation(line: 37, column: 100, scope: !42)
!45 = !DILocation(line: 40, column: 29, scope: !42)
!46 = !DILocation(line: 40, column: 12, scope: !42)
!47 = !DILocation(line: 40, column: 10, scope: !42)
!48 = !DILocation(line: 41, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !42, file: !20, line: 41, column: 9)
!50 = !DILocation(line: 41, column: 14, scope: !49)
!51 = !DILocation(line: 41, column: 9, scope: !42)
!52 = !DILocation(line: 41, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !20, line: 41, column: 23)
!54 = !DILocation(line: 42, column: 5, scope: !42)
!55 = !DILocation(line: 42, column: 11, scope: !42)
!56 = !DILocation(line: 42, column: 18, scope: !42)
!57 = !DILocation(line: 43, column: 5, scope: !42)
!58 = !DILocation(line: 43, column: 11, scope: !42)
!59 = !DILocation(line: 43, column: 18, scope: !42)
!60 = !DILocation(line: 44, column: 12, scope: !42)
!61 = !DILocation(line: 44, column: 5, scope: !42)
