; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp = icmp eq i32 %3, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %7 = load i32*, i32** %data, align 8, !dbg !44
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !45
  %8 = load i32*, i32** %data, align 8, !dbg !46
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !47
  %9 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %9), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 400, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %dataBuffer, align 8, !dbg !79
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  store i32* %2, i32** %data, align 8, !dbg !83
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !84
  %cmp = icmp ne i32 %3, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %7 = load i32*, i32** %data, align 8, !dbg !100
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !101
  %8 = load i32*, i32** %data, align 8, !dbg !102
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !103
  %9 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %9), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 400, align 16, !dbg !112
  %1 = bitcast i8* %0 to i32*, !dbg !113
  store i32* %1, i32** %dataBuffer, align 8, !dbg !111
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  store i32* %2, i32** %data, align 8, !dbg !115
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !116
  %cmp = icmp eq i32 %3, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !120
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !122
  %5 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !128
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !129
  %7 = load i32*, i32** %data, align 8, !dbg !130
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !131
  %8 = load i32*, i32** %data, align 8, !dbg !132
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !133
  %9 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %9), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 32, type: !4)
!22 = !DILocation(line: 32, column: 15, scope: !15)
!23 = !DILocation(line: 32, column: 39, scope: !15)
!24 = !DILocation(line: 32, column: 28, scope: !15)
!25 = !DILocation(line: 33, column: 12, scope: !15)
!26 = !DILocation(line: 33, column: 10, scope: !15)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 25, scope: !28)
!30 = !DILocation(line: 34, column: 8, scope: !15)
!31 = !DILocation(line: 37, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !16, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 9, scope: !32)
!34 = !DILocation(line: 38, column: 9, scope: !32)
!35 = !DILocation(line: 38, column: 21, scope: !32)
!36 = !DILocation(line: 39, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !16, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 41, column: 17, scope: !38)
!43 = !DILocation(line: 43, column: 18, scope: !38)
!44 = !DILocation(line: 43, column: 31, scope: !38)
!45 = !DILocation(line: 43, column: 24, scope: !38)
!46 = !DILocation(line: 43, column: 45, scope: !38)
!47 = !DILocation(line: 43, column: 9, scope: !38)
!48 = !DILocation(line: 44, column: 20, scope: !38)
!49 = !DILocation(line: 44, column: 9, scope: !38)
!50 = !DILocation(line: 46, column: 1, scope: !15)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_13_good", scope: !16, file: !16, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 99, column: 5, scope: !51)
!53 = !DILocation(line: 100, column: 5, scope: !51)
!54 = !DILocation(line: 101, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 113, type: !56, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !16, line: 113, type: !7)
!62 = !DILocation(line: 113, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !16, line: 113, type: !58)
!64 = !DILocation(line: 113, column: 27, scope: !55)
!65 = !DILocation(line: 116, column: 22, scope: !55)
!66 = !DILocation(line: 116, column: 12, scope: !55)
!67 = !DILocation(line: 116, column: 5, scope: !55)
!68 = !DILocation(line: 118, column: 5, scope: !55)
!69 = !DILocation(line: 119, column: 5, scope: !55)
!70 = !DILocation(line: 120, column: 5, scope: !55)
!71 = !DILocation(line: 123, column: 5, scope: !55)
!72 = !DILocation(line: 124, column: 5, scope: !55)
!73 = !DILocation(line: 125, column: 5, scope: !55)
!74 = !DILocation(line: 127, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !16, line: 55, type: !4)
!77 = !DILocation(line: 55, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !16, line: 56, type: !4)
!79 = !DILocation(line: 56, column: 15, scope: !75)
!80 = !DILocation(line: 56, column: 39, scope: !75)
!81 = !DILocation(line: 56, column: 28, scope: !75)
!82 = !DILocation(line: 57, column: 12, scope: !75)
!83 = !DILocation(line: 57, column: 10, scope: !75)
!84 = !DILocation(line: 58, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !16, line: 58, column: 8)
!86 = !DILocation(line: 58, column: 25, scope: !85)
!87 = !DILocation(line: 58, column: 8, scope: !75)
!88 = !DILocation(line: 61, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !16, line: 59, column: 5)
!90 = !DILocation(line: 62, column: 5, scope: !89)
!91 = !DILocation(line: 66, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !16, line: 64, column: 5)
!93 = !DILocation(line: 66, column: 9, scope: !92)
!94 = !DILocation(line: 67, column: 9, scope: !92)
!95 = !DILocation(line: 67, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !16, line: 70, type: !39)
!97 = distinct !DILexicalBlock(scope: !75, file: !16, line: 69, column: 5)
!98 = !DILocation(line: 70, column: 17, scope: !97)
!99 = !DILocation(line: 72, column: 18, scope: !97)
!100 = !DILocation(line: 72, column: 31, scope: !97)
!101 = !DILocation(line: 72, column: 24, scope: !97)
!102 = !DILocation(line: 72, column: 45, scope: !97)
!103 = !DILocation(line: 72, column: 9, scope: !97)
!104 = !DILocation(line: 73, column: 20, scope: !97)
!105 = !DILocation(line: 73, column: 9, scope: !97)
!106 = !DILocation(line: 75, column: 1, scope: !75)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 80, type: !4)
!109 = !DILocation(line: 80, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !16, line: 81, type: !4)
!111 = !DILocation(line: 81, column: 15, scope: !107)
!112 = !DILocation(line: 81, column: 39, scope: !107)
!113 = !DILocation(line: 81, column: 28, scope: !107)
!114 = !DILocation(line: 82, column: 12, scope: !107)
!115 = !DILocation(line: 82, column: 10, scope: !107)
!116 = !DILocation(line: 83, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !16, line: 83, column: 8)
!118 = !DILocation(line: 83, column: 25, scope: !117)
!119 = !DILocation(line: 83, column: 8, scope: !107)
!120 = !DILocation(line: 86, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !16, line: 84, column: 5)
!122 = !DILocation(line: 86, column: 9, scope: !121)
!123 = !DILocation(line: 87, column: 9, scope: !121)
!124 = !DILocation(line: 87, column: 20, scope: !121)
!125 = !DILocation(line: 88, column: 5, scope: !121)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !16, line: 90, type: !39)
!127 = distinct !DILexicalBlock(scope: !107, file: !16, line: 89, column: 5)
!128 = !DILocation(line: 90, column: 17, scope: !127)
!129 = !DILocation(line: 92, column: 18, scope: !127)
!130 = !DILocation(line: 92, column: 31, scope: !127)
!131 = !DILocation(line: 92, column: 24, scope: !127)
!132 = !DILocation(line: 92, column: 45, scope: !127)
!133 = !DILocation(line: 92, column: 9, scope: !127)
!134 = !DILocation(line: 93, column: 20, scope: !127)
!135 = !DILocation(line: 93, column: 9, scope: !127)
!136 = !DILocation(line: 95, column: 1, scope: !107)
