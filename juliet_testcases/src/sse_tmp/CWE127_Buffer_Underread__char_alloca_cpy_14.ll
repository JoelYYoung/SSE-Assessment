; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_cpy_14.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_cpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_cpy_14_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i32, i32* @globalFive, align 4, !dbg !26
  %cmp = icmp eq i32 %3, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !41
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !42
  store i8 0, i8* %arrayidx1, align 1, !dbg !43
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %call = call i8* @strcpy(i8* %arraydecay2, i8* %5) #5, !dbg !46
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @printLine(i8* %arraydecay3), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_cpy_14_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__char_alloca_cpy_14_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__char_alloca_cpy_14_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 100, align 16, !dbg !78
  store i8* %0, i8** %dataBuffer, align 8, !dbg !77
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !80
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %3 = load i32, i32* @globalFive, align 4, !dbg !83
  %cmp = icmp ne i32 %3, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  store i8* %4, i8** %data, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !96
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !97
  store i8 0, i8* %arrayidx1, align 1, !dbg !98
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !100
  %call = call i8* @strcpy(i8* %arraydecay2, i8* %5) #5, !dbg !101
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !102
  call void @printLine(i8* %arraydecay3), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 100, align 16, !dbg !110
  store i8* %0, i8** %dataBuffer, align 8, !dbg !109
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !112
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  %3 = load i32, i32* @globalFive, align 4, !dbg !115
  %cmp = icmp eq i32 %3, 5, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  store i8* %4, i8** %data, align 8, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !126
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !127
  store i8 0, i8* %arrayidx1, align 1, !dbg !128
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !130
  %call = call i8* @strcpy(i8* %arraydecay2, i8* %5) #5, !dbg !131
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !132
  call void @printLine(i8* %arraydecay3), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_cpy_14_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!28 = !DILocation(line: 29, column: 18, scope: !27)
!29 = !DILocation(line: 29, column: 8, scope: !13)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 200)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 36, column: 9, scope: !36)
!42 = !DILocation(line: 37, column: 9, scope: !36)
!43 = !DILocation(line: 37, column: 23, scope: !36)
!44 = !DILocation(line: 39, column: 16, scope: !36)
!45 = !DILocation(line: 39, column: 22, scope: !36)
!46 = !DILocation(line: 39, column: 9, scope: !36)
!47 = !DILocation(line: 40, column: 19, scope: !36)
!48 = !DILocation(line: 40, column: 9, scope: !36)
!49 = !DILocation(line: 42, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_cpy_14_good", scope: !14, file: !14, line: 97, type: !15, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 99, column: 5, scope: !50)
!52 = !DILocation(line: 100, column: 5, scope: !50)
!53 = !DILocation(line: 101, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 113, type: !55, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 113, type: !57)
!60 = !DILocation(line: 113, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 113, type: !58)
!62 = !DILocation(line: 113, column: 27, scope: !54)
!63 = !DILocation(line: 116, column: 22, scope: !54)
!64 = !DILocation(line: 116, column: 12, scope: !54)
!65 = !DILocation(line: 116, column: 5, scope: !54)
!66 = !DILocation(line: 118, column: 5, scope: !54)
!67 = !DILocation(line: 119, column: 5, scope: !54)
!68 = !DILocation(line: 120, column: 5, scope: !54)
!69 = !DILocation(line: 123, column: 5, scope: !54)
!70 = !DILocation(line: 124, column: 5, scope: !54)
!71 = !DILocation(line: 125, column: 5, scope: !54)
!72 = !DILocation(line: 127, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 51, type: !4)
!75 = !DILocation(line: 51, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !14, line: 52, type: !4)
!77 = !DILocation(line: 52, column: 12, scope: !73)
!78 = !DILocation(line: 52, column: 33, scope: !73)
!79 = !DILocation(line: 53, column: 12, scope: !73)
!80 = !DILocation(line: 53, column: 5, scope: !73)
!81 = !DILocation(line: 54, column: 5, scope: !73)
!82 = !DILocation(line: 54, column: 23, scope: !73)
!83 = !DILocation(line: 55, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !73, file: !14, line: 55, column: 8)
!85 = !DILocation(line: 55, column: 18, scope: !84)
!86 = !DILocation(line: 55, column: 8, scope: !73)
!87 = !DILocation(line: 58, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !14, line: 56, column: 5)
!89 = !DILocation(line: 59, column: 5, scope: !88)
!90 = !DILocation(line: 63, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !14, line: 61, column: 5)
!92 = !DILocation(line: 63, column: 14, scope: !91)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !14, line: 66, type: !37)
!94 = distinct !DILexicalBlock(scope: !73, file: !14, line: 65, column: 5)
!95 = !DILocation(line: 66, column: 14, scope: !94)
!96 = !DILocation(line: 67, column: 9, scope: !94)
!97 = !DILocation(line: 68, column: 9, scope: !94)
!98 = !DILocation(line: 68, column: 23, scope: !94)
!99 = !DILocation(line: 70, column: 16, scope: !94)
!100 = !DILocation(line: 70, column: 22, scope: !94)
!101 = !DILocation(line: 70, column: 9, scope: !94)
!102 = !DILocation(line: 71, column: 19, scope: !94)
!103 = !DILocation(line: 71, column: 9, scope: !94)
!104 = !DILocation(line: 73, column: 1, scope: !73)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 78, type: !4)
!107 = !DILocation(line: 78, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !14, line: 79, type: !4)
!109 = !DILocation(line: 79, column: 12, scope: !105)
!110 = !DILocation(line: 79, column: 33, scope: !105)
!111 = !DILocation(line: 80, column: 12, scope: !105)
!112 = !DILocation(line: 80, column: 5, scope: !105)
!113 = !DILocation(line: 81, column: 5, scope: !105)
!114 = !DILocation(line: 81, column: 23, scope: !105)
!115 = !DILocation(line: 82, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !105, file: !14, line: 82, column: 8)
!117 = !DILocation(line: 82, column: 18, scope: !116)
!118 = !DILocation(line: 82, column: 8, scope: !105)
!119 = !DILocation(line: 85, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !14, line: 83, column: 5)
!121 = !DILocation(line: 85, column: 14, scope: !120)
!122 = !DILocation(line: 86, column: 5, scope: !120)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !14, line: 88, type: !37)
!124 = distinct !DILexicalBlock(scope: !105, file: !14, line: 87, column: 5)
!125 = !DILocation(line: 88, column: 14, scope: !124)
!126 = !DILocation(line: 89, column: 9, scope: !124)
!127 = !DILocation(line: 90, column: 9, scope: !124)
!128 = !DILocation(line: 90, column: 23, scope: !124)
!129 = !DILocation(line: 92, column: 16, scope: !124)
!130 = !DILocation(line: 92, column: 22, scope: !124)
!131 = !DILocation(line: 92, column: 9, scope: !124)
!132 = !DILocation(line: 93, column: 19, scope: !124)
!133 = !DILocation(line: 93, column: 9, scope: !124)
!134 = !DILocation(line: 95, column: 1, scope: !105)
