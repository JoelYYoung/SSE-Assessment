; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_10.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_10_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i32, i32* @globalTrue, align 4, !dbg !26
  %tobool = icmp ne i32 %3, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !46
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !47
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx5, align 1, !dbg !49
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @printLine(i8* %arraydecay6), !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_10_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_10_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_10_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 100, align 16, !dbg !81
  store i8* %0, i8** %dataBuffer, align 8, !dbg !80
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !83
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %3 = load i32, i32* @globalFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %3, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  store i8* %4, i8** %data, align 8, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !98
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx1, align 1, !dbg !100
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !104
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !105
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx5, align 1, !dbg !107
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @printLine(i8* %arraydecay6), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 100, align 16, !dbg !116
  store i8* %0, i8** %dataBuffer, align 8, !dbg !115
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !118
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %3 = load i32, i32* @globalTrue, align 4, !dbg !121
  %tobool = icmp ne i32 %3, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  store i8* %4, i8** %data, align 8, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx1, align 1, !dbg !133
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !134
  %5 = load i8*, i8** %data, align 8, !dbg !135
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !137
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !138
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx5, align 1, !dbg !140
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @printLine(i8* %arraydecay6), !dbg !142
  ret void, !dbg !143
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_10_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_10.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 29, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!28 = !DILocation(line: 29, column: 8, scope: !13)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!31 = !DILocation(line: 32, column: 27, scope: !30)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 5, scope: !30)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocation(line: 36, column: 9, scope: !35)
!41 = !DILocation(line: 37, column: 9, scope: !35)
!42 = !DILocation(line: 37, column: 21, scope: !35)
!43 = !DILocation(line: 39, column: 17, scope: !35)
!44 = !DILocation(line: 39, column: 23, scope: !35)
!45 = !DILocation(line: 39, column: 36, scope: !35)
!46 = !DILocation(line: 39, column: 29, scope: !35)
!47 = !DILocation(line: 39, column: 9, scope: !35)
!48 = !DILocation(line: 41, column: 9, scope: !35)
!49 = !DILocation(line: 41, column: 21, scope: !35)
!50 = !DILocation(line: 42, column: 19, scope: !35)
!51 = !DILocation(line: 42, column: 9, scope: !35)
!52 = !DILocation(line: 44, column: 1, scope: !13)
!53 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_10_good", scope: !14, file: !14, line: 103, type: !15, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 105, column: 5, scope: !53)
!55 = !DILocation(line: 106, column: 5, scope: !53)
!56 = !DILocation(line: 107, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 119, type: !58, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !14, line: 119, type: !60)
!63 = !DILocation(line: 119, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !14, line: 119, type: !61)
!65 = !DILocation(line: 119, column: 27, scope: !57)
!66 = !DILocation(line: 122, column: 22, scope: !57)
!67 = !DILocation(line: 122, column: 12, scope: !57)
!68 = !DILocation(line: 122, column: 5, scope: !57)
!69 = !DILocation(line: 124, column: 5, scope: !57)
!70 = !DILocation(line: 125, column: 5, scope: !57)
!71 = !DILocation(line: 126, column: 5, scope: !57)
!72 = !DILocation(line: 129, column: 5, scope: !57)
!73 = !DILocation(line: 130, column: 5, scope: !57)
!74 = !DILocation(line: 131, column: 5, scope: !57)
!75 = !DILocation(line: 133, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 53, type: !4)
!78 = !DILocation(line: 53, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !14, line: 54, type: !4)
!80 = !DILocation(line: 54, column: 12, scope: !76)
!81 = !DILocation(line: 54, column: 33, scope: !76)
!82 = !DILocation(line: 55, column: 12, scope: !76)
!83 = !DILocation(line: 55, column: 5, scope: !76)
!84 = !DILocation(line: 56, column: 5, scope: !76)
!85 = !DILocation(line: 56, column: 23, scope: !76)
!86 = !DILocation(line: 57, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !76, file: !14, line: 57, column: 8)
!88 = !DILocation(line: 57, column: 8, scope: !76)
!89 = !DILocation(line: 60, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !14, line: 58, column: 5)
!91 = !DILocation(line: 61, column: 5, scope: !90)
!92 = !DILocation(line: 65, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !14, line: 63, column: 5)
!94 = !DILocation(line: 65, column: 14, scope: !93)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !14, line: 68, type: !36)
!96 = distinct !DILexicalBlock(scope: !76, file: !14, line: 67, column: 5)
!97 = !DILocation(line: 68, column: 14, scope: !96)
!98 = !DILocation(line: 69, column: 9, scope: !96)
!99 = !DILocation(line: 70, column: 9, scope: !96)
!100 = !DILocation(line: 70, column: 21, scope: !96)
!101 = !DILocation(line: 72, column: 17, scope: !96)
!102 = !DILocation(line: 72, column: 23, scope: !96)
!103 = !DILocation(line: 72, column: 36, scope: !96)
!104 = !DILocation(line: 72, column: 29, scope: !96)
!105 = !DILocation(line: 72, column: 9, scope: !96)
!106 = !DILocation(line: 74, column: 9, scope: !96)
!107 = !DILocation(line: 74, column: 21, scope: !96)
!108 = !DILocation(line: 75, column: 19, scope: !96)
!109 = !DILocation(line: 75, column: 9, scope: !96)
!110 = !DILocation(line: 77, column: 1, scope: !76)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !14, line: 82, type: !4)
!113 = !DILocation(line: 82, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !14, line: 83, type: !4)
!115 = !DILocation(line: 83, column: 12, scope: !111)
!116 = !DILocation(line: 83, column: 33, scope: !111)
!117 = !DILocation(line: 84, column: 12, scope: !111)
!118 = !DILocation(line: 84, column: 5, scope: !111)
!119 = !DILocation(line: 85, column: 5, scope: !111)
!120 = !DILocation(line: 85, column: 23, scope: !111)
!121 = !DILocation(line: 86, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !111, file: !14, line: 86, column: 8)
!123 = !DILocation(line: 86, column: 8, scope: !111)
!124 = !DILocation(line: 89, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 87, column: 5)
!126 = !DILocation(line: 89, column: 14, scope: !125)
!127 = !DILocation(line: 90, column: 5, scope: !125)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !14, line: 92, type: !36)
!129 = distinct !DILexicalBlock(scope: !111, file: !14, line: 91, column: 5)
!130 = !DILocation(line: 92, column: 14, scope: !129)
!131 = !DILocation(line: 93, column: 9, scope: !129)
!132 = !DILocation(line: 94, column: 9, scope: !129)
!133 = !DILocation(line: 94, column: 21, scope: !129)
!134 = !DILocation(line: 96, column: 17, scope: !129)
!135 = !DILocation(line: 96, column: 23, scope: !129)
!136 = !DILocation(line: 96, column: 36, scope: !129)
!137 = !DILocation(line: 96, column: 29, scope: !129)
!138 = !DILocation(line: 96, column: 9, scope: !129)
!139 = !DILocation(line: 98, column: 9, scope: !129)
!140 = !DILocation(line: 98, column: 21, scope: !129)
!141 = !DILocation(line: 99, column: 19, scope: !129)
!142 = !DILocation(line: 99, column: 9, scope: !129)
!143 = !DILocation(line: 101, column: 1, scope: !111)
