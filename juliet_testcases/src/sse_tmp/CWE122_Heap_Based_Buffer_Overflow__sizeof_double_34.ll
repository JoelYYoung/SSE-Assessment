; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType = type { double* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType, align 8
  %data1 = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store double* null, double** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !28
  %0 = bitcast i8* %call to double*, !dbg !29
  store double* %0, double** %data, align 8, !dbg !30
  %1 = load double*, double** %data, align 8, !dbg !31
  %cmp = icmp eq double* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !37
  store double 1.700000e+300, double* %2, align 8, !dbg !38
  %3 = load double*, double** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType* %myUnion to double**, !dbg !40
  store double* %3, double** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata double** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType* %myUnion to double**, !dbg !45
  %4 = load double*, double** %unionSecond, align 8, !dbg !45
  store double* %4, double** %data1, align 8, !dbg !44
  %5 = load double*, double** %data1, align 8, !dbg !46
  %6 = load double, double* %5, align 8, !dbg !47
  call void @printDoubleLine(double %6), !dbg !48
  %7 = load double*, double** %data1, align 8, !dbg !49
  %8 = bitcast double* %7 to i8*, !dbg !49
  call void @free(i8* %8) #5, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printDoubleLine(double) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca double*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType, align 8
  %data1 = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType* %myUnion, metadata !79, metadata !DIExpression()), !dbg !80
  store double* null, double** %data, align 8, !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !82
  %0 = bitcast i8* %call to double*, !dbg !83
  store double* %0, double** %data, align 8, !dbg !84
  %1 = load double*, double** %data, align 8, !dbg !85
  %cmp = icmp eq double* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !91
  store double 1.700000e+300, double* %2, align 8, !dbg !92
  %3 = load double*, double** %data, align 8, !dbg !93
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType* %myUnion to double**, !dbg !94
  store double* %3, double** %unionFirst, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata double** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType* %myUnion to double**, !dbg !99
  %4 = load double*, double** %unionSecond, align 8, !dbg !99
  store double* %4, double** %data1, align 8, !dbg !98
  %5 = load double*, double** %data1, align 8, !dbg !100
  %6 = load double, double* %5, align 8, !dbg !101
  call void @printDoubleLine(double %6), !dbg !102
  %7 = load double*, double** %data1, align 8, !dbg !103
  %8 = bitcast double* %7 to i8*, !dbg !103
  call void @free(i8* %8) #5, !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !4)
!19 = !DILocation(line: 29, column: 14, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_unionType", file: !15, line: 23, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 19, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 21, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 22, baseType: !4, size: 64)
!26 = !DILocation(line: 30, column: 67, scope: !14)
!27 = !DILocation(line: 32, column: 10, scope: !14)
!28 = !DILocation(line: 35, column: 22, scope: !14)
!29 = !DILocation(line: 35, column: 12, scope: !14)
!30 = !DILocation(line: 35, column: 10, scope: !14)
!31 = !DILocation(line: 36, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 9)
!33 = !DILocation(line: 36, column: 14, scope: !32)
!34 = !DILocation(line: 36, column: 9, scope: !14)
!35 = !DILocation(line: 36, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 36, column: 23)
!37 = !DILocation(line: 37, column: 6, scope: !14)
!38 = !DILocation(line: 37, column: 11, scope: !14)
!39 = !DILocation(line: 38, column: 26, scope: !14)
!40 = !DILocation(line: 38, column: 13, scope: !14)
!41 = !DILocation(line: 38, column: 24, scope: !14)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 40, type: !4)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 18, scope: !43)
!45 = !DILocation(line: 40, column: 33, scope: !43)
!46 = !DILocation(line: 42, column: 26, scope: !43)
!47 = !DILocation(line: 42, column: 25, scope: !43)
!48 = !DILocation(line: 42, column: 9, scope: !43)
!49 = !DILocation(line: 43, column: 14, scope: !43)
!50 = !DILocation(line: 43, column: 9, scope: !43)
!51 = !DILocation(line: 45, column: 1, scope: !14)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_34_good", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 73, column: 5, scope: !52)
!54 = !DILocation(line: 74, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 85, type: !56, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 85, type: !58)
!63 = !DILocation(line: 85, column: 14, scope: !55)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 85, type: !59)
!65 = !DILocation(line: 85, column: 27, scope: !55)
!66 = !DILocation(line: 88, column: 22, scope: !55)
!67 = !DILocation(line: 88, column: 12, scope: !55)
!68 = !DILocation(line: 88, column: 5, scope: !55)
!69 = !DILocation(line: 90, column: 5, scope: !55)
!70 = !DILocation(line: 91, column: 5, scope: !55)
!71 = !DILocation(line: 92, column: 5, scope: !55)
!72 = !DILocation(line: 95, column: 5, scope: !55)
!73 = !DILocation(line: 96, column: 5, scope: !55)
!74 = !DILocation(line: 97, column: 5, scope: !55)
!75 = !DILocation(line: 99, column: 5, scope: !55)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 54, type: !4)
!78 = !DILocation(line: 54, column: 14, scope: !76)
!79 = !DILocalVariable(name: "myUnion", scope: !76, file: !15, line: 55, type: !21)
!80 = !DILocation(line: 55, column: 67, scope: !76)
!81 = !DILocation(line: 57, column: 10, scope: !76)
!82 = !DILocation(line: 59, column: 22, scope: !76)
!83 = !DILocation(line: 59, column: 12, scope: !76)
!84 = !DILocation(line: 59, column: 10, scope: !76)
!85 = !DILocation(line: 60, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !15, line: 60, column: 9)
!87 = !DILocation(line: 60, column: 14, scope: !86)
!88 = !DILocation(line: 60, column: 9, scope: !76)
!89 = !DILocation(line: 60, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !15, line: 60, column: 23)
!91 = !DILocation(line: 61, column: 6, scope: !76)
!92 = !DILocation(line: 61, column: 11, scope: !76)
!93 = !DILocation(line: 62, column: 26, scope: !76)
!94 = !DILocation(line: 62, column: 13, scope: !76)
!95 = !DILocation(line: 62, column: 24, scope: !76)
!96 = !DILocalVariable(name: "data", scope: !97, file: !15, line: 64, type: !4)
!97 = distinct !DILexicalBlock(scope: !76, file: !15, line: 63, column: 5)
!98 = !DILocation(line: 64, column: 18, scope: !97)
!99 = !DILocation(line: 64, column: 33, scope: !97)
!100 = !DILocation(line: 66, column: 26, scope: !97)
!101 = !DILocation(line: 66, column: 25, scope: !97)
!102 = !DILocation(line: 66, column: 9, scope: !97)
!103 = !DILocation(line: 67, column: 14, scope: !97)
!104 = !DILocation(line: 67, column: 9, scope: !97)
!105 = !DILocation(line: 69, column: 1, scope: !76)
