; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_badSink(double* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load double*, double** %data.addr, align 8, !dbg !20
  %1 = load double, double* %0, align 8, !dbg !21
  call void @printDoubleLine(double %1), !dbg !22
  %2 = load double*, double** %data.addr, align 8, !dbg !23
  %3 = bitcast double* %2 to i8*, !dbg !23
  call void @free(i8* %3) #5, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_bad() #0 !dbg !26 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store double* null, double** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !32
  %0 = bitcast i8* %call to double*, !dbg !33
  store double* %0, double** %data, align 8, !dbg !34
  %1 = load double*, double** %data, align 8, !dbg !35
  %cmp = icmp eq double* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !41
  store double 1.700000e+300, double* %2, align 8, !dbg !42
  %3 = load double*, double** %data, align 8, !dbg !43
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_badSink(double* %3), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_goodG2BSink(double* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load double*, double** %data.addr, align 8, !dbg !49
  %1 = load double, double* %0, align 8, !dbg !50
  call void @printDoubleLine(double %1), !dbg !51
  %2 = load double*, double** %data.addr, align 8, !dbg !52
  %3 = bitcast double* %2 to i8*, !dbg !52
  call void @free(i8* %3) #5, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store double* null, double** %data, align 8, !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !83
  %0 = bitcast i8* %call to double*, !dbg !84
  store double* %0, double** %data, align 8, !dbg !85
  %1 = load double*, double** %data, align 8, !dbg !86
  %cmp = icmp eq double* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !92
  store double 1.700000e+300, double* %2, align 8, !dbg !93
  %3 = load double*, double** %data, align 8, !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_goodG2BSink(double* %3), !dbg !95
  ret void, !dbg !96
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_badSink", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 21, type: !4)
!19 = !DILocation(line: 21, column: 75, scope: !14)
!20 = !DILocation(line: 24, column: 22, scope: !14)
!21 = !DILocation(line: 24, column: 21, scope: !14)
!22 = !DILocation(line: 24, column: 5, scope: !14)
!23 = !DILocation(line: 25, column: 10, scope: !14)
!24 = !DILocation(line: 25, column: 5, scope: !14)
!25 = !DILocation(line: 26, column: 1, scope: !14)
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_bad", scope: !15, file: !15, line: 28, type: !27, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !15, line: 30, type: !4)
!30 = !DILocation(line: 30, column: 14, scope: !26)
!31 = !DILocation(line: 32, column: 10, scope: !26)
!32 = !DILocation(line: 35, column: 22, scope: !26)
!33 = !DILocation(line: 35, column: 12, scope: !26)
!34 = !DILocation(line: 35, column: 10, scope: !26)
!35 = !DILocation(line: 36, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !26, file: !15, line: 36, column: 9)
!37 = !DILocation(line: 36, column: 14, scope: !36)
!38 = !DILocation(line: 36, column: 9, scope: !26)
!39 = !DILocation(line: 36, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 36, column: 23)
!41 = !DILocation(line: 37, column: 6, scope: !26)
!42 = !DILocation(line: 37, column: 11, scope: !26)
!43 = !DILocation(line: 38, column: 65, scope: !26)
!44 = !DILocation(line: 38, column: 5, scope: !26)
!45 = !DILocation(line: 39, column: 1, scope: !26)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_goodG2BSink", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !15, line: 45, type: !4)
!48 = !DILocation(line: 45, column: 79, scope: !46)
!49 = !DILocation(line: 48, column: 22, scope: !46)
!50 = !DILocation(line: 48, column: 21, scope: !46)
!51 = !DILocation(line: 48, column: 5, scope: !46)
!52 = !DILocation(line: 49, column: 10, scope: !46)
!53 = !DILocation(line: 49, column: 5, scope: !46)
!54 = !DILocation(line: 50, column: 1, scope: !46)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_41_good", scope: !15, file: !15, line: 65, type: !27, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 67, column: 5, scope: !55)
!57 = !DILocation(line: 68, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 80, type: !59, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 80, type: !61)
!66 = !DILocation(line: 80, column: 14, scope: !58)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 80, type: !62)
!68 = !DILocation(line: 80, column: 27, scope: !58)
!69 = !DILocation(line: 83, column: 22, scope: !58)
!70 = !DILocation(line: 83, column: 12, scope: !58)
!71 = !DILocation(line: 83, column: 5, scope: !58)
!72 = !DILocation(line: 85, column: 5, scope: !58)
!73 = !DILocation(line: 86, column: 5, scope: !58)
!74 = !DILocation(line: 87, column: 5, scope: !58)
!75 = !DILocation(line: 90, column: 5, scope: !58)
!76 = !DILocation(line: 91, column: 5, scope: !58)
!77 = !DILocation(line: 92, column: 5, scope: !58)
!78 = !DILocation(line: 94, column: 5, scope: !58)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 53, type: !27, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 55, type: !4)
!81 = !DILocation(line: 55, column: 14, scope: !79)
!82 = !DILocation(line: 57, column: 10, scope: !79)
!83 = !DILocation(line: 59, column: 22, scope: !79)
!84 = !DILocation(line: 59, column: 12, scope: !79)
!85 = !DILocation(line: 59, column: 10, scope: !79)
!86 = !DILocation(line: 60, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !15, line: 60, column: 9)
!88 = !DILocation(line: 60, column: 14, scope: !87)
!89 = !DILocation(line: 60, column: 9, scope: !79)
!90 = !DILocation(line: 60, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 60, column: 23)
!92 = !DILocation(line: 61, column: 6, scope: !79)
!93 = !DILocation(line: 61, column: 11, scope: !79)
!94 = !DILocation(line: 62, column: 69, scope: !79)
!95 = !DILocation(line: 62, column: 5, scope: !79)
!96 = !DILocation(line: 63, column: 1, scope: !79)
