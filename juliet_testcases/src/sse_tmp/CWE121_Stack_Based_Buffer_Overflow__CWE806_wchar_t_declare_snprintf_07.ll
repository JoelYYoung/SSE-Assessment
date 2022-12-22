; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #6, !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %4 = load i32*, i32** %data, align 8, !dbg !48
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %6), !dbg !53
  ret void, !dbg !54
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay, i32** %data, align 8, !dbg !85
  %0 = load i32, i32* @staticFive, align 4, !dbg !86
  %cmp = icmp ne i32 %0, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !95
  %2 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !100
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !101
  %4 = load i32*, i32** %data, align 8, !dbg !102
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %6), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !114
  store i32* %arraydecay, i32** %data, align 8, !dbg !115
  %0 = load i32, i32* @staticFive, align 4, !dbg !116
  %cmp = icmp eq i32 %0, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !122
  %2 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !128
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !129
  %4 = load i32*, i32** %data, align 8, !dbg !130
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !131
  %5 = load i32*, i32** %data, align 8, !dbg !132
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #6, !dbg !133
  %6 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %6), !dbg !135
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 31, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07_bad", scope: !8, file: !8, line: 35, type: !17, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 37, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DILocation(line: 37, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 38, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 38, column: 13, scope: !16)
!29 = !DILocation(line: 39, column: 12, scope: !16)
!30 = !DILocation(line: 39, column: 10, scope: !16)
!31 = !DILocation(line: 40, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 8)
!33 = !DILocation(line: 40, column: 18, scope: !32)
!34 = !DILocation(line: 40, column: 8, scope: !16)
!35 = !DILocation(line: 43, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 41, column: 5)
!37 = !DILocation(line: 43, column: 9, scope: !36)
!38 = !DILocation(line: 44, column: 9, scope: !36)
!39 = !DILocation(line: 44, column: 21, scope: !36)
!40 = !DILocation(line: 45, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !8, line: 47, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !8, line: 46, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 47, column: 17, scope: !42)
!47 = !DILocation(line: 49, column: 18, scope: !42)
!48 = !DILocation(line: 49, column: 31, scope: !42)
!49 = !DILocation(line: 49, column: 24, scope: !42)
!50 = !DILocation(line: 49, column: 45, scope: !42)
!51 = !DILocation(line: 49, column: 9, scope: !42)
!52 = !DILocation(line: 50, column: 20, scope: !42)
!53 = !DILocation(line: 50, column: 9, scope: !42)
!54 = !DILocation(line: 52, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_07_good", scope: !8, file: !8, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 105, column: 5, scope: !55)
!57 = !DILocation(line: 106, column: 5, scope: !55)
!58 = !DILocation(line: 107, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 119, type: !60, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!9, !9, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !8, line: 119, type: !9)
!66 = !DILocation(line: 119, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !8, line: 119, type: !62)
!68 = !DILocation(line: 119, column: 27, scope: !59)
!69 = !DILocation(line: 122, column: 22, scope: !59)
!70 = !DILocation(line: 122, column: 12, scope: !59)
!71 = !DILocation(line: 122, column: 5, scope: !59)
!72 = !DILocation(line: 124, column: 5, scope: !59)
!73 = !DILocation(line: 125, column: 5, scope: !59)
!74 = !DILocation(line: 126, column: 5, scope: !59)
!75 = !DILocation(line: 129, column: 5, scope: !59)
!76 = !DILocation(line: 130, column: 5, scope: !59)
!77 = !DILocation(line: 131, column: 5, scope: !59)
!78 = !DILocation(line: 133, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !8, line: 61, type: !20)
!81 = !DILocation(line: 61, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !8, line: 62, type: !25)
!83 = !DILocation(line: 62, column: 13, scope: !79)
!84 = !DILocation(line: 63, column: 12, scope: !79)
!85 = !DILocation(line: 63, column: 10, scope: !79)
!86 = !DILocation(line: 64, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !8, line: 64, column: 8)
!88 = !DILocation(line: 64, column: 18, scope: !87)
!89 = !DILocation(line: 64, column: 8, scope: !79)
!90 = !DILocation(line: 67, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !8, line: 65, column: 5)
!92 = !DILocation(line: 68, column: 5, scope: !91)
!93 = !DILocation(line: 72, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !8, line: 70, column: 5)
!95 = !DILocation(line: 72, column: 9, scope: !94)
!96 = !DILocation(line: 73, column: 9, scope: !94)
!97 = !DILocation(line: 73, column: 20, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !8, line: 76, type: !43)
!99 = distinct !DILexicalBlock(scope: !79, file: !8, line: 75, column: 5)
!100 = !DILocation(line: 76, column: 17, scope: !99)
!101 = !DILocation(line: 78, column: 18, scope: !99)
!102 = !DILocation(line: 78, column: 31, scope: !99)
!103 = !DILocation(line: 78, column: 24, scope: !99)
!104 = !DILocation(line: 78, column: 45, scope: !99)
!105 = !DILocation(line: 78, column: 9, scope: !99)
!106 = !DILocation(line: 79, column: 20, scope: !99)
!107 = !DILocation(line: 79, column: 9, scope: !99)
!108 = !DILocation(line: 81, column: 1, scope: !79)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !8, line: 86, type: !20)
!111 = !DILocation(line: 86, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !8, line: 87, type: !25)
!113 = !DILocation(line: 87, column: 13, scope: !109)
!114 = !DILocation(line: 88, column: 12, scope: !109)
!115 = !DILocation(line: 88, column: 10, scope: !109)
!116 = !DILocation(line: 89, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !8, line: 89, column: 8)
!118 = !DILocation(line: 89, column: 18, scope: !117)
!119 = !DILocation(line: 89, column: 8, scope: !109)
!120 = !DILocation(line: 92, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !8, line: 90, column: 5)
!122 = !DILocation(line: 92, column: 9, scope: !121)
!123 = !DILocation(line: 93, column: 9, scope: !121)
!124 = !DILocation(line: 93, column: 20, scope: !121)
!125 = !DILocation(line: 94, column: 5, scope: !121)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !8, line: 96, type: !43)
!127 = distinct !DILexicalBlock(scope: !109, file: !8, line: 95, column: 5)
!128 = !DILocation(line: 96, column: 17, scope: !127)
!129 = !DILocation(line: 98, column: 18, scope: !127)
!130 = !DILocation(line: 98, column: 31, scope: !127)
!131 = !DILocation(line: 98, column: 24, scope: !127)
!132 = !DILocation(line: 98, column: 45, scope: !127)
!133 = !DILocation(line: 98, column: 9, scope: !127)
!134 = !DILocation(line: 99, column: 20, scope: !127)
!135 = !DILocation(line: 99, column: 9, scope: !127)
!136 = !DILocation(line: 101, column: 1, scope: !109)
