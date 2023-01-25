; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store double* null, double** %data, align 8, !dbg !20
  %0 = load double*, double** %data, align 8, !dbg !21
  %call = call double* @badSource(double* %0), !dbg !22
  store double* %call, double** %data, align 8, !dbg !23
  %1 = load double*, double** %data, align 8, !dbg !24
  %2 = load double, double* %1, align 8, !dbg !25
  call void @printDoubleLine(double %2), !dbg !26
  %3 = load double*, double** %data, align 8, !dbg !27
  %4 = bitcast double* %3 to i8*, !dbg !27
  call void @free(i8* %4) #5, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal double* @badSource(double* %data) #0 !dbg !30 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !33, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !35
  %0 = bitcast i8* %call to double*, !dbg !36
  store double* %0, double** %data.addr, align 8, !dbg !37
  %1 = load double*, double** %data.addr, align 8, !dbg !38
  %cmp = icmp eq double* %1, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data.addr, align 8, !dbg !44
  store double 1.700000e+300, double* %2, align 8, !dbg !45
  %3 = load double*, double** %data.addr, align 8, !dbg !46
  ret double* %3, !dbg !47
}

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store double* null, double** %data, align 8, !dbg !75
  %0 = load double*, double** %data, align 8, !dbg !76
  %call = call double* @goodG2BSource(double* %0), !dbg !77
  store double* %call, double** %data, align 8, !dbg !78
  %1 = load double*, double** %data, align 8, !dbg !79
  %2 = load double, double* %1, align 8, !dbg !80
  call void @printDoubleLine(double %2), !dbg !81
  %3 = load double*, double** %data, align 8, !dbg !82
  %4 = bitcast double* %3 to i8*, !dbg !82
  call void @free(i8* %4) #5, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal double* @goodG2BSource(double* %data) #0 !dbg !85 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !88
  %0 = bitcast i8* %call to double*, !dbg !89
  store double* %0, double** %data.addr, align 8, !dbg !90
  %1 = load double*, double** %data.addr, align 8, !dbg !91
  %cmp = icmp eq double* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data.addr, align 8, !dbg !97
  store double 1.700000e+300, double* %2, align 8, !dbg !98
  %3 = load double*, double** %data.addr, align 8, !dbg !99
  ret double* %3, !dbg !100
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_bad", scope: !15, file: !15, line: 31, type: !16, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 33, type: !5)
!19 = !DILocation(line: 33, column: 14, scope: !14)
!20 = !DILocation(line: 35, column: 10, scope: !14)
!21 = !DILocation(line: 36, column: 22, scope: !14)
!22 = !DILocation(line: 36, column: 12, scope: !14)
!23 = !DILocation(line: 36, column: 10, scope: !14)
!24 = !DILocation(line: 38, column: 22, scope: !14)
!25 = !DILocation(line: 38, column: 21, scope: !14)
!26 = !DILocation(line: 38, column: 5, scope: !14)
!27 = !DILocation(line: 39, column: 10, scope: !14)
!28 = !DILocation(line: 39, column: 5, scope: !14)
!29 = !DILocation(line: 40, column: 1, scope: !14)
!30 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 21, type: !31, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{!5, !5}
!33 = !DILocalVariable(name: "data", arg: 1, scope: !30, file: !15, line: 21, type: !5)
!34 = !DILocation(line: 21, column: 36, scope: !30)
!35 = !DILocation(line: 25, column: 22, scope: !30)
!36 = !DILocation(line: 25, column: 12, scope: !30)
!37 = !DILocation(line: 25, column: 10, scope: !30)
!38 = !DILocation(line: 26, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !15, line: 26, column: 9)
!40 = !DILocation(line: 26, column: 14, scope: !39)
!41 = !DILocation(line: 26, column: 9, scope: !30)
!42 = !DILocation(line: 26, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 26, column: 23)
!44 = !DILocation(line: 27, column: 6, scope: !30)
!45 = !DILocation(line: 27, column: 11, scope: !30)
!46 = !DILocation(line: 28, column: 12, scope: !30)
!47 = !DILocation(line: 28, column: 5, scope: !30)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_42_good", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 69, column: 5, scope: !48)
!50 = !DILocation(line: 70, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 82, type: !52, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !15, line: 82, type: !54)
!59 = !DILocation(line: 82, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !15, line: 82, type: !55)
!61 = !DILocation(line: 82, column: 27, scope: !51)
!62 = !DILocation(line: 85, column: 22, scope: !51)
!63 = !DILocation(line: 85, column: 12, scope: !51)
!64 = !DILocation(line: 85, column: 5, scope: !51)
!65 = !DILocation(line: 87, column: 5, scope: !51)
!66 = !DILocation(line: 88, column: 5, scope: !51)
!67 = !DILocation(line: 89, column: 5, scope: !51)
!68 = !DILocation(line: 92, column: 5, scope: !51)
!69 = !DILocation(line: 93, column: 5, scope: !51)
!70 = !DILocation(line: 94, column: 5, scope: !51)
!71 = !DILocation(line: 96, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !15, line: 58, type: !5)
!74 = !DILocation(line: 58, column: 14, scope: !72)
!75 = !DILocation(line: 60, column: 10, scope: !72)
!76 = !DILocation(line: 61, column: 26, scope: !72)
!77 = !DILocation(line: 61, column: 12, scope: !72)
!78 = !DILocation(line: 61, column: 10, scope: !72)
!79 = !DILocation(line: 63, column: 22, scope: !72)
!80 = !DILocation(line: 63, column: 21, scope: !72)
!81 = !DILocation(line: 63, column: 5, scope: !72)
!82 = !DILocation(line: 64, column: 10, scope: !72)
!83 = !DILocation(line: 64, column: 5, scope: !72)
!84 = !DILocation(line: 65, column: 1, scope: !72)
!85 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 46, type: !31, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", arg: 1, scope: !85, file: !15, line: 46, type: !5)
!87 = !DILocation(line: 46, column: 40, scope: !85)
!88 = !DILocation(line: 49, column: 22, scope: !85)
!89 = !DILocation(line: 49, column: 12, scope: !85)
!90 = !DILocation(line: 49, column: 10, scope: !85)
!91 = !DILocation(line: 50, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !15, line: 50, column: 9)
!93 = !DILocation(line: 50, column: 14, scope: !92)
!94 = !DILocation(line: 50, column: 9, scope: !85)
!95 = !DILocation(line: 50, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 50, column: 23)
!97 = !DILocation(line: 51, column: 6, scope: !85)
!98 = !DILocation(line: 51, column: 11, scope: !85)
!99 = !DILocation(line: 52, column: 12, scope: !85)
!100 = !DILocation(line: 52, column: 5, scope: !85)
