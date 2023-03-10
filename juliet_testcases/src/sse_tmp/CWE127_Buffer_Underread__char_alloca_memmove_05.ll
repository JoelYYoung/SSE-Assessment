; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memmove_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %3 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %3, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !37
  store i8* %add.ptr, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %5, i64 100, i1 false), !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @printLine(i8* %arraydecay4), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memmove_05_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__char_alloca_memmove_05_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__char_alloca_memmove_05_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 100, align 16, !dbg !83
  store i8* %0, i8** %dataBuffer, align 8, !dbg !82
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !85
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %3 = load i32, i32* @staticFalse, align 4, !dbg !88
  %tobool = icmp ne i32 %3, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  store i8* %4, i8** %data, align 8, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !100
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx1, align 1, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %5, i64 100, i1 false), !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx3, align 1, !dbg !106
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay4), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 100, align 16, !dbg !115
  store i8* %0, i8** %dataBuffer, align 8, !dbg !114
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !117
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %3 = load i32, i32* @staticTrue, align 4, !dbg !120
  %tobool = icmp ne i32 %3, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !123
  store i8* %4, i8** %data, align 8, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx1, align 1, !dbg !132
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  %5 = load i8*, i8** %data, align 8, !dbg !134
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %5, i64 100, i1 false), !dbg !133
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !135
  store i8 0, i8* %arrayidx3, align 1, !dbg !136
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  call void @printLine(i8* %arraydecay4), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memmove_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 33, scope: !20)
!28 = !DILocation(line: 34, column: 12, scope: !20)
!29 = !DILocation(line: 34, column: 5, scope: !20)
!30 = !DILocation(line: 35, column: 5, scope: !20)
!31 = !DILocation(line: 35, column: 23, scope: !20)
!32 = !DILocation(line: 36, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !20, file: !12, line: 36, column: 8)
!34 = !DILocation(line: 36, column: 8, scope: !20)
!35 = !DILocation(line: 39, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 37, column: 5)
!37 = !DILocation(line: 39, column: 27, scope: !36)
!38 = !DILocation(line: 39, column: 14, scope: !36)
!39 = !DILocation(line: 40, column: 5, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 42, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 42, column: 14, scope: !41)
!46 = !DILocation(line: 43, column: 9, scope: !41)
!47 = !DILocation(line: 44, column: 9, scope: !41)
!48 = !DILocation(line: 44, column: 21, scope: !41)
!49 = !DILocation(line: 46, column: 9, scope: !41)
!50 = !DILocation(line: 46, column: 23, scope: !41)
!51 = !DILocation(line: 48, column: 9, scope: !41)
!52 = !DILocation(line: 48, column: 21, scope: !41)
!53 = !DILocation(line: 49, column: 19, scope: !41)
!54 = !DILocation(line: 49, column: 9, scope: !41)
!55 = !DILocation(line: 51, column: 1, scope: !20)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memmove_05_good", scope: !12, file: !12, line: 110, type: !21, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 112, column: 5, scope: !56)
!58 = !DILocation(line: 113, column: 5, scope: !56)
!59 = !DILocation(line: 114, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 126, type: !61, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!13, !13, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 126, type: !13)
!65 = !DILocation(line: 126, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 126, type: !63)
!67 = !DILocation(line: 126, column: 27, scope: !60)
!68 = !DILocation(line: 129, column: 22, scope: !60)
!69 = !DILocation(line: 129, column: 12, scope: !60)
!70 = !DILocation(line: 129, column: 5, scope: !60)
!71 = !DILocation(line: 131, column: 5, scope: !60)
!72 = !DILocation(line: 132, column: 5, scope: !60)
!73 = !DILocation(line: 133, column: 5, scope: !60)
!74 = !DILocation(line: 136, column: 5, scope: !60)
!75 = !DILocation(line: 137, column: 5, scope: !60)
!76 = !DILocation(line: 138, column: 5, scope: !60)
!77 = !DILocation(line: 140, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 60, type: !6)
!80 = !DILocation(line: 60, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !12, line: 61, type: !6)
!82 = !DILocation(line: 61, column: 12, scope: !78)
!83 = !DILocation(line: 61, column: 33, scope: !78)
!84 = !DILocation(line: 62, column: 12, scope: !78)
!85 = !DILocation(line: 62, column: 5, scope: !78)
!86 = !DILocation(line: 63, column: 5, scope: !78)
!87 = !DILocation(line: 63, column: 23, scope: !78)
!88 = !DILocation(line: 64, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !78, file: !12, line: 64, column: 8)
!90 = !DILocation(line: 64, column: 8, scope: !78)
!91 = !DILocation(line: 67, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 65, column: 5)
!93 = !DILocation(line: 68, column: 5, scope: !92)
!94 = !DILocation(line: 72, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !12, line: 70, column: 5)
!96 = !DILocation(line: 72, column: 14, scope: !95)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !12, line: 75, type: !42)
!98 = distinct !DILexicalBlock(scope: !78, file: !12, line: 74, column: 5)
!99 = !DILocation(line: 75, column: 14, scope: !98)
!100 = !DILocation(line: 76, column: 9, scope: !98)
!101 = !DILocation(line: 77, column: 9, scope: !98)
!102 = !DILocation(line: 77, column: 21, scope: !98)
!103 = !DILocation(line: 79, column: 9, scope: !98)
!104 = !DILocation(line: 79, column: 23, scope: !98)
!105 = !DILocation(line: 81, column: 9, scope: !98)
!106 = !DILocation(line: 81, column: 21, scope: !98)
!107 = !DILocation(line: 82, column: 19, scope: !98)
!108 = !DILocation(line: 82, column: 9, scope: !98)
!109 = !DILocation(line: 84, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 89, type: !6)
!112 = !DILocation(line: 89, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !12, line: 90, type: !6)
!114 = !DILocation(line: 90, column: 12, scope: !110)
!115 = !DILocation(line: 90, column: 33, scope: !110)
!116 = !DILocation(line: 91, column: 12, scope: !110)
!117 = !DILocation(line: 91, column: 5, scope: !110)
!118 = !DILocation(line: 92, column: 5, scope: !110)
!119 = !DILocation(line: 92, column: 23, scope: !110)
!120 = !DILocation(line: 93, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !110, file: !12, line: 93, column: 8)
!122 = !DILocation(line: 93, column: 8, scope: !110)
!123 = !DILocation(line: 96, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 94, column: 5)
!125 = !DILocation(line: 96, column: 14, scope: !124)
!126 = !DILocation(line: 97, column: 5, scope: !124)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !12, line: 99, type: !42)
!128 = distinct !DILexicalBlock(scope: !110, file: !12, line: 98, column: 5)
!129 = !DILocation(line: 99, column: 14, scope: !128)
!130 = !DILocation(line: 100, column: 9, scope: !128)
!131 = !DILocation(line: 101, column: 9, scope: !128)
!132 = !DILocation(line: 101, column: 21, scope: !128)
!133 = !DILocation(line: 103, column: 9, scope: !128)
!134 = !DILocation(line: 103, column: 23, scope: !128)
!135 = !DILocation(line: 105, column: 9, scope: !128)
!136 = !DILocation(line: 105, column: 21, scope: !128)
!137 = !DILocation(line: 106, column: 19, scope: !128)
!138 = !DILocation(line: 106, column: 9, scope: !128)
!139 = !DILocation(line: 108, column: 1, scope: !110)
