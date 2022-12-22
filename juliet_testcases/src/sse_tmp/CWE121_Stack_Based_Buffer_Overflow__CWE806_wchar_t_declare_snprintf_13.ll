; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !28
  %cmp = icmp eq i32 %0, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #6, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %4 = load i32*, i32** %data, align 8, !dbg !45
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %6), !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !81
  store i32* %arraydecay, i32** %data, align 8, !dbg !82
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !83
  %cmp = icmp ne i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !92
  %2 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !97
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !98
  %4 = load i32*, i32** %data, align 8, !dbg !99
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %6), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i32* %arraydecay, i32** %data, align 8, !dbg !112
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !113
  %cmp = icmp eq i32 %0, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !119
  %2 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !125
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !126
  %4 = load i32*, i32** %data, align 8, !dbg !127
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !128
  %5 = load i32*, i32** %data, align 8, !dbg !129
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  call void @printWLine(i32* %6), !dbg !132
  ret void, !dbg !133
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 32, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 32, column: 13, scope: !11)
!26 = !DILocation(line: 33, column: 12, scope: !11)
!27 = !DILocation(line: 33, column: 10, scope: !11)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 25, scope: !29)
!31 = !DILocation(line: 34, column: 8, scope: !11)
!32 = !DILocation(line: 37, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 35, column: 5)
!34 = !DILocation(line: 37, column: 9, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 21, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 17, scope: !39)
!44 = !DILocation(line: 43, column: 18, scope: !39)
!45 = !DILocation(line: 43, column: 31, scope: !39)
!46 = !DILocation(line: 43, column: 24, scope: !39)
!47 = !DILocation(line: 43, column: 45, scope: !39)
!48 = !DILocation(line: 43, column: 9, scope: !39)
!49 = !DILocation(line: 44, column: 20, scope: !39)
!50 = !DILocation(line: 44, column: 9, scope: !39)
!51 = !DILocation(line: 46, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_13_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 99, column: 5, scope: !52)
!54 = !DILocation(line: 100, column: 5, scope: !52)
!55 = !DILocation(line: 101, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !57, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 113, type: !19)
!63 = !DILocation(line: 113, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 113, type: !59)
!65 = !DILocation(line: 113, column: 27, scope: !56)
!66 = !DILocation(line: 116, column: 22, scope: !56)
!67 = !DILocation(line: 116, column: 12, scope: !56)
!68 = !DILocation(line: 116, column: 5, scope: !56)
!69 = !DILocation(line: 118, column: 5, scope: !56)
!70 = !DILocation(line: 119, column: 5, scope: !56)
!71 = !DILocation(line: 120, column: 5, scope: !56)
!72 = !DILocation(line: 123, column: 5, scope: !56)
!73 = !DILocation(line: 124, column: 5, scope: !56)
!74 = !DILocation(line: 125, column: 5, scope: !56)
!75 = !DILocation(line: 127, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 55, type: !16)
!78 = !DILocation(line: 55, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 56, type: !22)
!80 = !DILocation(line: 56, column: 13, scope: !76)
!81 = !DILocation(line: 57, column: 12, scope: !76)
!82 = !DILocation(line: 57, column: 10, scope: !76)
!83 = !DILocation(line: 58, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !76, file: !12, line: 58, column: 8)
!85 = !DILocation(line: 58, column: 25, scope: !84)
!86 = !DILocation(line: 58, column: 8, scope: !76)
!87 = !DILocation(line: 61, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !12, line: 59, column: 5)
!89 = !DILocation(line: 62, column: 5, scope: !88)
!90 = !DILocation(line: 66, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !12, line: 64, column: 5)
!92 = !DILocation(line: 66, column: 9, scope: !91)
!93 = !DILocation(line: 67, column: 9, scope: !91)
!94 = !DILocation(line: 67, column: 20, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !12, line: 70, type: !40)
!96 = distinct !DILexicalBlock(scope: !76, file: !12, line: 69, column: 5)
!97 = !DILocation(line: 70, column: 17, scope: !96)
!98 = !DILocation(line: 72, column: 18, scope: !96)
!99 = !DILocation(line: 72, column: 31, scope: !96)
!100 = !DILocation(line: 72, column: 24, scope: !96)
!101 = !DILocation(line: 72, column: 45, scope: !96)
!102 = !DILocation(line: 72, column: 9, scope: !96)
!103 = !DILocation(line: 73, column: 20, scope: !96)
!104 = !DILocation(line: 73, column: 9, scope: !96)
!105 = !DILocation(line: 75, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 80, type: !16)
!108 = !DILocation(line: 80, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !12, line: 81, type: !22)
!110 = !DILocation(line: 81, column: 13, scope: !106)
!111 = !DILocation(line: 82, column: 12, scope: !106)
!112 = !DILocation(line: 82, column: 10, scope: !106)
!113 = !DILocation(line: 83, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !12, line: 83, column: 8)
!115 = !DILocation(line: 83, column: 25, scope: !114)
!116 = !DILocation(line: 83, column: 8, scope: !106)
!117 = !DILocation(line: 86, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !12, line: 84, column: 5)
!119 = !DILocation(line: 86, column: 9, scope: !118)
!120 = !DILocation(line: 87, column: 9, scope: !118)
!121 = !DILocation(line: 87, column: 20, scope: !118)
!122 = !DILocation(line: 88, column: 5, scope: !118)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !12, line: 90, type: !40)
!124 = distinct !DILexicalBlock(scope: !106, file: !12, line: 89, column: 5)
!125 = !DILocation(line: 90, column: 17, scope: !124)
!126 = !DILocation(line: 92, column: 18, scope: !124)
!127 = !DILocation(line: 92, column: 31, scope: !124)
!128 = !DILocation(line: 92, column: 24, scope: !124)
!129 = !DILocation(line: 92, column: 45, scope: !124)
!130 = !DILocation(line: 92, column: 9, scope: !124)
!131 = !DILocation(line: 93, column: 20, scope: !124)
!132 = !DILocation(line: 93, column: 9, scope: !124)
!133 = !DILocation(line: 95, column: 1, scope: !106)
