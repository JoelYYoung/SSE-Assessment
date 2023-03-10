; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %0, i8** %dataBuffer, align 8, !dbg !24
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !27
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %3 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %3, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx1, align 1, !dbg !47
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !51
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !52
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay6), !dbg !56
  ret void, !dbg !57
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
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_07_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #7, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #7, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_07_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_07_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %0, i8** %dataBuffer, align 8, !dbg !84
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !87
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  %3 = load i32, i32* @staticFive, align 4, !dbg !90
  %cmp = icmp ne i32 %3, 5, !dbg !92
  br i1 %cmp, label %if.then, label %if.else, !dbg !93

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
  %3 = load i32, i32* @staticFive, align 4, !dbg !126
  %cmp = icmp eq i32 %3, 5, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  store i8* %4, i8** %data, align 8, !dbg !132
  br label %if.end, !dbg !133

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !137
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx1, align 1, !dbg !139
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  %5 = load i8*, i8** %data, align 8, !dbg !141
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !143
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !144
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx5, align 1, !dbg !146
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  call void @printLine(i8* %arraydecay6), !dbg !148
  ret void, !dbg !149
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 31, type: !6)
!22 = !DILocation(line: 31, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocation(line: 32, column: 33, scope: !18)
!26 = !DILocation(line: 33, column: 12, scope: !18)
!27 = !DILocation(line: 33, column: 5, scope: !18)
!28 = !DILocation(line: 34, column: 5, scope: !18)
!29 = !DILocation(line: 34, column: 23, scope: !18)
!30 = !DILocation(line: 35, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!32 = !DILocation(line: 35, column: 18, scope: !31)
!33 = !DILocation(line: 35, column: 8, scope: !18)
!34 = !DILocation(line: 38, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 36, column: 5)
!36 = !DILocation(line: 38, column: 27, scope: !35)
!37 = !DILocation(line: 38, column: 14, scope: !35)
!38 = !DILocation(line: 39, column: 5, scope: !35)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !10, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 41, column: 14, scope: !40)
!45 = !DILocation(line: 42, column: 9, scope: !40)
!46 = !DILocation(line: 43, column: 9, scope: !40)
!47 = !DILocation(line: 43, column: 21, scope: !40)
!48 = !DILocation(line: 45, column: 17, scope: !40)
!49 = !DILocation(line: 45, column: 23, scope: !40)
!50 = !DILocation(line: 45, column: 36, scope: !40)
!51 = !DILocation(line: 45, column: 29, scope: !40)
!52 = !DILocation(line: 45, column: 9, scope: !40)
!53 = !DILocation(line: 47, column: 9, scope: !40)
!54 = !DILocation(line: 47, column: 21, scope: !40)
!55 = !DILocation(line: 48, column: 19, scope: !40)
!56 = !DILocation(line: 48, column: 9, scope: !40)
!57 = !DILocation(line: 50, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_07_good", scope: !10, file: !10, line: 109, type: !19, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 111, column: 5, scope: !58)
!60 = !DILocation(line: 112, column: 5, scope: !58)
!61 = !DILocation(line: 113, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 125, type: !63, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!11, !11, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !10, line: 125, type: !11)
!67 = !DILocation(line: 125, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !10, line: 125, type: !65)
!69 = !DILocation(line: 125, column: 27, scope: !62)
!70 = !DILocation(line: 128, column: 22, scope: !62)
!71 = !DILocation(line: 128, column: 12, scope: !62)
!72 = !DILocation(line: 128, column: 5, scope: !62)
!73 = !DILocation(line: 130, column: 5, scope: !62)
!74 = !DILocation(line: 131, column: 5, scope: !62)
!75 = !DILocation(line: 132, column: 5, scope: !62)
!76 = !DILocation(line: 135, column: 5, scope: !62)
!77 = !DILocation(line: 136, column: 5, scope: !62)
!78 = !DILocation(line: 137, column: 5, scope: !62)
!79 = !DILocation(line: 139, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 59, type: !6)
!82 = !DILocation(line: 59, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !10, line: 60, type: !6)
!84 = !DILocation(line: 60, column: 12, scope: !80)
!85 = !DILocation(line: 60, column: 33, scope: !80)
!86 = !DILocation(line: 61, column: 12, scope: !80)
!87 = !DILocation(line: 61, column: 5, scope: !80)
!88 = !DILocation(line: 62, column: 5, scope: !80)
!89 = !DILocation(line: 62, column: 23, scope: !80)
!90 = !DILocation(line: 63, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !10, line: 63, column: 8)
!92 = !DILocation(line: 63, column: 18, scope: !91)
!93 = !DILocation(line: 63, column: 8, scope: !80)
!94 = !DILocation(line: 66, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !10, line: 64, column: 5)
!96 = !DILocation(line: 67, column: 5, scope: !95)
!97 = !DILocation(line: 71, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !10, line: 69, column: 5)
!99 = !DILocation(line: 71, column: 14, scope: !98)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !10, line: 74, type: !41)
!101 = distinct !DILexicalBlock(scope: !80, file: !10, line: 73, column: 5)
!102 = !DILocation(line: 74, column: 14, scope: !101)
!103 = !DILocation(line: 75, column: 9, scope: !101)
!104 = !DILocation(line: 76, column: 9, scope: !101)
!105 = !DILocation(line: 76, column: 21, scope: !101)
!106 = !DILocation(line: 78, column: 17, scope: !101)
!107 = !DILocation(line: 78, column: 23, scope: !101)
!108 = !DILocation(line: 78, column: 36, scope: !101)
!109 = !DILocation(line: 78, column: 29, scope: !101)
!110 = !DILocation(line: 78, column: 9, scope: !101)
!111 = !DILocation(line: 80, column: 9, scope: !101)
!112 = !DILocation(line: 80, column: 21, scope: !101)
!113 = !DILocation(line: 81, column: 19, scope: !101)
!114 = !DILocation(line: 81, column: 9, scope: !101)
!115 = !DILocation(line: 83, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !10, line: 88, type: !6)
!118 = !DILocation(line: 88, column: 12, scope: !116)
!119 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !10, line: 89, type: !6)
!120 = !DILocation(line: 89, column: 12, scope: !116)
!121 = !DILocation(line: 89, column: 33, scope: !116)
!122 = !DILocation(line: 90, column: 12, scope: !116)
!123 = !DILocation(line: 90, column: 5, scope: !116)
!124 = !DILocation(line: 91, column: 5, scope: !116)
!125 = !DILocation(line: 91, column: 23, scope: !116)
!126 = !DILocation(line: 92, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !116, file: !10, line: 92, column: 8)
!128 = !DILocation(line: 92, column: 18, scope: !127)
!129 = !DILocation(line: 92, column: 8, scope: !116)
!130 = !DILocation(line: 95, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !10, line: 93, column: 5)
!132 = !DILocation(line: 95, column: 14, scope: !131)
!133 = !DILocation(line: 96, column: 5, scope: !131)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !10, line: 98, type: !41)
!135 = distinct !DILexicalBlock(scope: !116, file: !10, line: 97, column: 5)
!136 = !DILocation(line: 98, column: 14, scope: !135)
!137 = !DILocation(line: 99, column: 9, scope: !135)
!138 = !DILocation(line: 100, column: 9, scope: !135)
!139 = !DILocation(line: 100, column: 21, scope: !135)
!140 = !DILocation(line: 102, column: 17, scope: !135)
!141 = !DILocation(line: 102, column: 23, scope: !135)
!142 = !DILocation(line: 102, column: 36, scope: !135)
!143 = !DILocation(line: 102, column: 29, scope: !135)
!144 = !DILocation(line: 102, column: 9, scope: !135)
!145 = !DILocation(line: 104, column: 9, scope: !135)
!146 = !DILocation(line: 104, column: 21, scope: !135)
!147 = !DILocation(line: 105, column: 19, scope: !135)
!148 = !DILocation(line: 105, column: 9, scope: !135)
!149 = !DILocation(line: 107, column: 1, scope: !116)
