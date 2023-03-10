; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_05.c"
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
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_05_bad() #0 !dbg !20 {
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
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !52
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !53
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx5, align 1, !dbg !55
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay6), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_05_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_05_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_05_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 100, align 16, !dbg !86
  store i8* %0, i8** %dataBuffer, align 8, !dbg !85
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !88
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  %3 = load i32, i32* @staticFalse, align 4, !dbg !91
  %tobool = icmp ne i32 %3, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  store i8* %4, i8** %data, align 8, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !103
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx1, align 1, !dbg !105
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  %5 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !109
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !110
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx5, align 1, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @printLine(i8* %arraydecay6), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 100, align 16, !dbg !121
  store i8* %0, i8** %dataBuffer, align 8, !dbg !120
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !123
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  %3 = load i32, i32* @staticTrue, align 4, !dbg !126
  %tobool = icmp ne i32 %3, 0, !dbg !126
  br i1 %tobool, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !129
  store i8* %4, i8** %data, align 8, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !136
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !137
  store i8 0, i8* %arrayidx1, align 1, !dbg !138
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  %5 = load i8*, i8** %data, align 8, !dbg !140
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !142
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !143
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !144
  store i8 0, i8* %arrayidx5, align 1, !dbg !145
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !146
  call void @printLine(i8* %arraydecay6), !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!49 = !DILocation(line: 46, column: 17, scope: !41)
!50 = !DILocation(line: 46, column: 23, scope: !41)
!51 = !DILocation(line: 46, column: 36, scope: !41)
!52 = !DILocation(line: 46, column: 29, scope: !41)
!53 = !DILocation(line: 46, column: 9, scope: !41)
!54 = !DILocation(line: 48, column: 9, scope: !41)
!55 = !DILocation(line: 48, column: 21, scope: !41)
!56 = !DILocation(line: 49, column: 19, scope: !41)
!57 = !DILocation(line: 49, column: 9, scope: !41)
!58 = !DILocation(line: 51, column: 1, scope: !20)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_05_good", scope: !12, file: !12, line: 110, type: !21, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 112, column: 5, scope: !59)
!61 = !DILocation(line: 113, column: 5, scope: !59)
!62 = !DILocation(line: 114, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 126, type: !64, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!13, !13, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 126, type: !13)
!68 = !DILocation(line: 126, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 126, type: !66)
!70 = !DILocation(line: 126, column: 27, scope: !63)
!71 = !DILocation(line: 129, column: 22, scope: !63)
!72 = !DILocation(line: 129, column: 12, scope: !63)
!73 = !DILocation(line: 129, column: 5, scope: !63)
!74 = !DILocation(line: 131, column: 5, scope: !63)
!75 = !DILocation(line: 132, column: 5, scope: !63)
!76 = !DILocation(line: 133, column: 5, scope: !63)
!77 = !DILocation(line: 136, column: 5, scope: !63)
!78 = !DILocation(line: 137, column: 5, scope: !63)
!79 = !DILocation(line: 138, column: 5, scope: !63)
!80 = !DILocation(line: 140, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 60, type: !6)
!83 = !DILocation(line: 60, column: 12, scope: !81)
!84 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 61, type: !6)
!85 = !DILocation(line: 61, column: 12, scope: !81)
!86 = !DILocation(line: 61, column: 33, scope: !81)
!87 = !DILocation(line: 62, column: 12, scope: !81)
!88 = !DILocation(line: 62, column: 5, scope: !81)
!89 = !DILocation(line: 63, column: 5, scope: !81)
!90 = !DILocation(line: 63, column: 23, scope: !81)
!91 = !DILocation(line: 64, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !81, file: !12, line: 64, column: 8)
!93 = !DILocation(line: 64, column: 8, scope: !81)
!94 = !DILocation(line: 67, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !12, line: 65, column: 5)
!96 = !DILocation(line: 68, column: 5, scope: !95)
!97 = !DILocation(line: 72, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !12, line: 70, column: 5)
!99 = !DILocation(line: 72, column: 14, scope: !98)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 75, type: !42)
!101 = distinct !DILexicalBlock(scope: !81, file: !12, line: 74, column: 5)
!102 = !DILocation(line: 75, column: 14, scope: !101)
!103 = !DILocation(line: 76, column: 9, scope: !101)
!104 = !DILocation(line: 77, column: 9, scope: !101)
!105 = !DILocation(line: 77, column: 21, scope: !101)
!106 = !DILocation(line: 79, column: 17, scope: !101)
!107 = !DILocation(line: 79, column: 23, scope: !101)
!108 = !DILocation(line: 79, column: 36, scope: !101)
!109 = !DILocation(line: 79, column: 29, scope: !101)
!110 = !DILocation(line: 79, column: 9, scope: !101)
!111 = !DILocation(line: 81, column: 9, scope: !101)
!112 = !DILocation(line: 81, column: 21, scope: !101)
!113 = !DILocation(line: 82, column: 19, scope: !101)
!114 = !DILocation(line: 82, column: 9, scope: !101)
!115 = !DILocation(line: 84, column: 1, scope: !81)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 89, type: !6)
!118 = !DILocation(line: 89, column: 12, scope: !116)
!119 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !12, line: 90, type: !6)
!120 = !DILocation(line: 90, column: 12, scope: !116)
!121 = !DILocation(line: 90, column: 33, scope: !116)
!122 = !DILocation(line: 91, column: 12, scope: !116)
!123 = !DILocation(line: 91, column: 5, scope: !116)
!124 = !DILocation(line: 92, column: 5, scope: !116)
!125 = !DILocation(line: 92, column: 23, scope: !116)
!126 = !DILocation(line: 93, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !116, file: !12, line: 93, column: 8)
!128 = !DILocation(line: 93, column: 8, scope: !116)
!129 = !DILocation(line: 96, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 94, column: 5)
!131 = !DILocation(line: 96, column: 14, scope: !130)
!132 = !DILocation(line: 97, column: 5, scope: !130)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !12, line: 99, type: !42)
!134 = distinct !DILexicalBlock(scope: !116, file: !12, line: 98, column: 5)
!135 = !DILocation(line: 99, column: 14, scope: !134)
!136 = !DILocation(line: 100, column: 9, scope: !134)
!137 = !DILocation(line: 101, column: 9, scope: !134)
!138 = !DILocation(line: 101, column: 21, scope: !134)
!139 = !DILocation(line: 103, column: 17, scope: !134)
!140 = !DILocation(line: 103, column: 23, scope: !134)
!141 = !DILocation(line: 103, column: 36, scope: !134)
!142 = !DILocation(line: 103, column: 29, scope: !134)
!143 = !DILocation(line: 103, column: 9, scope: !134)
!144 = !DILocation(line: 105, column: 9, scope: !134)
!145 = !DILocation(line: 105, column: 21, scope: !134)
!146 = !DILocation(line: 106, column: 19, scope: !134)
!147 = !DILocation(line: 106, column: 9, scope: !134)
!148 = !DILocation(line: 108, column: 1, scope: !116)
