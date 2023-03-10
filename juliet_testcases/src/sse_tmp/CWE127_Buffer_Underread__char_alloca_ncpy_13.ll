; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_13.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_13_bad() #0 !dbg !13 {
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
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !26
  %cmp = icmp eq i32 %3, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx1, align 1, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !47
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !48
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx5, align 1, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @printLine(i8* %arraydecay6), !dbg !52
  ret void, !dbg !53
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
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_13_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_13_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_13_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 100, align 16, !dbg !82
  store i8* %0, i8** %dataBuffer, align 8, !dbg !81
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !84
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !87
  %cmp = icmp ne i32 %3, 5, !dbg !89
  br i1 %cmp, label %if.then, label %if.else, !dbg !90

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
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !106
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !107
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx5, align 1, !dbg !109
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @printLine(i8* %arraydecay6), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 100, align 16, !dbg !118
  store i8* %0, i8** %dataBuffer, align 8, !dbg !117
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !120
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !123
  %cmp = icmp eq i32 %3, 5, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !127
  store i8* %4, i8** %data, align 8, !dbg !129
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !134
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !135
  store i8 0, i8* %arrayidx1, align 1, !dbg !136
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  %5 = load i8*, i8** %data, align 8, !dbg !138
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !140
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %5, i64 %call) #7, !dbg !141
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx5, align 1, !dbg !143
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  call void @printLine(i8* %arraydecay6), !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_13_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!28 = !DILocation(line: 29, column: 25, scope: !27)
!29 = !DILocation(line: 29, column: 8, scope: !13)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 36, column: 9, scope: !36)
!42 = !DILocation(line: 37, column: 9, scope: !36)
!43 = !DILocation(line: 37, column: 21, scope: !36)
!44 = !DILocation(line: 39, column: 17, scope: !36)
!45 = !DILocation(line: 39, column: 23, scope: !36)
!46 = !DILocation(line: 39, column: 36, scope: !36)
!47 = !DILocation(line: 39, column: 29, scope: !36)
!48 = !DILocation(line: 39, column: 9, scope: !36)
!49 = !DILocation(line: 41, column: 9, scope: !36)
!50 = !DILocation(line: 41, column: 21, scope: !36)
!51 = !DILocation(line: 42, column: 19, scope: !36)
!52 = !DILocation(line: 42, column: 9, scope: !36)
!53 = !DILocation(line: 44, column: 1, scope: !13)
!54 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_13_good", scope: !14, file: !14, line: 103, type: !15, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 105, column: 5, scope: !54)
!56 = !DILocation(line: 106, column: 5, scope: !54)
!57 = !DILocation(line: 107, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 119, type: !59, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 119, type: !61)
!64 = !DILocation(line: 119, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 119, type: !62)
!66 = !DILocation(line: 119, column: 27, scope: !58)
!67 = !DILocation(line: 122, column: 22, scope: !58)
!68 = !DILocation(line: 122, column: 12, scope: !58)
!69 = !DILocation(line: 122, column: 5, scope: !58)
!70 = !DILocation(line: 124, column: 5, scope: !58)
!71 = !DILocation(line: 125, column: 5, scope: !58)
!72 = !DILocation(line: 126, column: 5, scope: !58)
!73 = !DILocation(line: 129, column: 5, scope: !58)
!74 = !DILocation(line: 130, column: 5, scope: !58)
!75 = !DILocation(line: 131, column: 5, scope: !58)
!76 = !DILocation(line: 133, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 53, type: !4)
!79 = !DILocation(line: 53, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !14, line: 54, type: !4)
!81 = !DILocation(line: 54, column: 12, scope: !77)
!82 = !DILocation(line: 54, column: 33, scope: !77)
!83 = !DILocation(line: 55, column: 12, scope: !77)
!84 = !DILocation(line: 55, column: 5, scope: !77)
!85 = !DILocation(line: 56, column: 5, scope: !77)
!86 = !DILocation(line: 56, column: 23, scope: !77)
!87 = !DILocation(line: 57, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !77, file: !14, line: 57, column: 8)
!89 = !DILocation(line: 57, column: 25, scope: !88)
!90 = !DILocation(line: 57, column: 8, scope: !77)
!91 = !DILocation(line: 60, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !14, line: 58, column: 5)
!93 = !DILocation(line: 61, column: 5, scope: !92)
!94 = !DILocation(line: 65, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !14, line: 63, column: 5)
!96 = !DILocation(line: 65, column: 14, scope: !95)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !14, line: 68, type: !37)
!98 = distinct !DILexicalBlock(scope: !77, file: !14, line: 67, column: 5)
!99 = !DILocation(line: 68, column: 14, scope: !98)
!100 = !DILocation(line: 69, column: 9, scope: !98)
!101 = !DILocation(line: 70, column: 9, scope: !98)
!102 = !DILocation(line: 70, column: 21, scope: !98)
!103 = !DILocation(line: 72, column: 17, scope: !98)
!104 = !DILocation(line: 72, column: 23, scope: !98)
!105 = !DILocation(line: 72, column: 36, scope: !98)
!106 = !DILocation(line: 72, column: 29, scope: !98)
!107 = !DILocation(line: 72, column: 9, scope: !98)
!108 = !DILocation(line: 74, column: 9, scope: !98)
!109 = !DILocation(line: 74, column: 21, scope: !98)
!110 = !DILocation(line: 75, column: 19, scope: !98)
!111 = !DILocation(line: 75, column: 9, scope: !98)
!112 = !DILocation(line: 77, column: 1, scope: !77)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !14, line: 82, type: !4)
!115 = !DILocation(line: 82, column: 12, scope: !113)
!116 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !14, line: 83, type: !4)
!117 = !DILocation(line: 83, column: 12, scope: !113)
!118 = !DILocation(line: 83, column: 33, scope: !113)
!119 = !DILocation(line: 84, column: 12, scope: !113)
!120 = !DILocation(line: 84, column: 5, scope: !113)
!121 = !DILocation(line: 85, column: 5, scope: !113)
!122 = !DILocation(line: 85, column: 23, scope: !113)
!123 = !DILocation(line: 86, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !113, file: !14, line: 86, column: 8)
!125 = !DILocation(line: 86, column: 25, scope: !124)
!126 = !DILocation(line: 86, column: 8, scope: !113)
!127 = !DILocation(line: 89, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !14, line: 87, column: 5)
!129 = !DILocation(line: 89, column: 14, scope: !128)
!130 = !DILocation(line: 90, column: 5, scope: !128)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !14, line: 92, type: !37)
!132 = distinct !DILexicalBlock(scope: !113, file: !14, line: 91, column: 5)
!133 = !DILocation(line: 92, column: 14, scope: !132)
!134 = !DILocation(line: 93, column: 9, scope: !132)
!135 = !DILocation(line: 94, column: 9, scope: !132)
!136 = !DILocation(line: 94, column: 21, scope: !132)
!137 = !DILocation(line: 96, column: 17, scope: !132)
!138 = !DILocation(line: 96, column: 23, scope: !132)
!139 = !DILocation(line: 96, column: 36, scope: !132)
!140 = !DILocation(line: 96, column: 29, scope: !132)
!141 = !DILocation(line: 96, column: 9, scope: !132)
!142 = !DILocation(line: 98, column: 9, scope: !132)
!143 = !DILocation(line: 98, column: 21, scope: !132)
!144 = !DILocation(line: 99, column: 19, scope: !132)
!145 = !DILocation(line: 99, column: 9, scope: !132)
!146 = !DILocation(line: 101, column: 1, scope: !113)
