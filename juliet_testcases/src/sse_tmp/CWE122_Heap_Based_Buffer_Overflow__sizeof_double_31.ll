; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  %dataCopy = alloca double*, align 8
  %data1 = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store double* null, double** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !21
  %0 = bitcast i8* %call to double*, !dbg !22
  store double* %0, double** %data, align 8, !dbg !23
  %1 = load double*, double** %data, align 8, !dbg !24
  %cmp = icmp eq double* %1, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !30
  store double 1.700000e+300, double* %2, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata double** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %3 = load double*, double** %data, align 8, !dbg !35
  store double* %3, double** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata double** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %4 = load double*, double** %dataCopy, align 8, !dbg !38
  store double* %4, double** %data1, align 8, !dbg !37
  %5 = load double*, double** %data1, align 8, !dbg !39
  %6 = load double, double* %5, align 8, !dbg !40
  call void @printDoubleLine(double %6), !dbg !41
  %7 = load double*, double** %data1, align 8, !dbg !42
  %8 = bitcast double* %7 to i8*, !dbg !42
  call void @free(i8* %8) #5, !dbg !43
  ret void, !dbg !44
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca double*, align 8
  %dataCopy = alloca double*, align 8
  %data1 = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store double* null, double** %data, align 8, !dbg !72
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !73
  %0 = bitcast i8* %call to double*, !dbg !74
  store double* %0, double** %data, align 8, !dbg !75
  %1 = load double*, double** %data, align 8, !dbg !76
  %cmp = icmp eq double* %1, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !82
  store double 1.700000e+300, double* %2, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata double** %dataCopy, metadata !84, metadata !DIExpression()), !dbg !86
  %3 = load double*, double** %data, align 8, !dbg !87
  store double* %3, double** %dataCopy, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata double** %data1, metadata !88, metadata !DIExpression()), !dbg !89
  %4 = load double*, double** %dataCopy, align 8, !dbg !90
  store double* %4, double** %data1, align 8, !dbg !89
  %5 = load double*, double** %data1, align 8, !dbg !91
  %6 = load double, double* %5, align 8, !dbg !92
  call void @printDoubleLine(double %6), !dbg !93
  %7 = load double*, double** %data1, align 8, !dbg !94
  %8 = bitcast double* %7 to i8*, !dbg !94
  call void @free(i8* %8) #5, !dbg !95
  ret void, !dbg !96
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 14, scope: !14)
!20 = !DILocation(line: 25, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 22, scope: !14)
!22 = !DILocation(line: 28, column: 12, scope: !14)
!23 = !DILocation(line: 28, column: 10, scope: !14)
!24 = !DILocation(line: 29, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!26 = !DILocation(line: 29, column: 14, scope: !25)
!27 = !DILocation(line: 29, column: 9, scope: !14)
!28 = !DILocation(line: 29, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 23)
!30 = !DILocation(line: 30, column: 6, scope: !14)
!31 = !DILocation(line: 30, column: 11, scope: !14)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !15, line: 32, type: !4)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 18, scope: !33)
!35 = !DILocation(line: 32, column: 29, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 33, type: !4)
!37 = !DILocation(line: 33, column: 18, scope: !33)
!38 = !DILocation(line: 33, column: 25, scope: !33)
!39 = !DILocation(line: 35, column: 26, scope: !33)
!40 = !DILocation(line: 35, column: 25, scope: !33)
!41 = !DILocation(line: 35, column: 9, scope: !33)
!42 = !DILocation(line: 36, column: 14, scope: !33)
!43 = !DILocation(line: 36, column: 9, scope: !33)
!44 = !DILocation(line: 38, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_31_good", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 65, column: 5, scope: !45)
!47 = !DILocation(line: 66, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 77, type: !49, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !15, line: 77, type: !51)
!56 = !DILocation(line: 77, column: 14, scope: !48)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !15, line: 77, type: !52)
!58 = !DILocation(line: 77, column: 27, scope: !48)
!59 = !DILocation(line: 80, column: 22, scope: !48)
!60 = !DILocation(line: 80, column: 12, scope: !48)
!61 = !DILocation(line: 80, column: 5, scope: !48)
!62 = !DILocation(line: 82, column: 5, scope: !48)
!63 = !DILocation(line: 83, column: 5, scope: !48)
!64 = !DILocation(line: 84, column: 5, scope: !48)
!65 = !DILocation(line: 87, column: 5, scope: !48)
!66 = !DILocation(line: 88, column: 5, scope: !48)
!67 = !DILocation(line: 89, column: 5, scope: !48)
!68 = !DILocation(line: 91, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 47, type: !4)
!71 = !DILocation(line: 47, column: 14, scope: !69)
!72 = !DILocation(line: 49, column: 10, scope: !69)
!73 = !DILocation(line: 51, column: 22, scope: !69)
!74 = !DILocation(line: 51, column: 12, scope: !69)
!75 = !DILocation(line: 51, column: 10, scope: !69)
!76 = !DILocation(line: 52, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !69, file: !15, line: 52, column: 9)
!78 = !DILocation(line: 52, column: 14, scope: !77)
!79 = !DILocation(line: 52, column: 9, scope: !69)
!80 = !DILocation(line: 52, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 52, column: 23)
!82 = !DILocation(line: 53, column: 6, scope: !69)
!83 = !DILocation(line: 53, column: 11, scope: !69)
!84 = !DILocalVariable(name: "dataCopy", scope: !85, file: !15, line: 55, type: !4)
!85 = distinct !DILexicalBlock(scope: !69, file: !15, line: 54, column: 5)
!86 = !DILocation(line: 55, column: 18, scope: !85)
!87 = !DILocation(line: 55, column: 29, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 56, type: !4)
!89 = !DILocation(line: 56, column: 18, scope: !85)
!90 = !DILocation(line: 56, column: 25, scope: !85)
!91 = !DILocation(line: 58, column: 26, scope: !85)
!92 = !DILocation(line: 58, column: 25, scope: !85)
!93 = !DILocation(line: 58, column: 9, scope: !85)
!94 = !DILocation(line: 59, column: 14, scope: !85)
!95 = !DILocation(line: 59, column: 9, scope: !85)
!96 = !DILocation(line: 61, column: 1, scope: !69)
