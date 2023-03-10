; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx1, align 1, !dbg !46
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !50
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !51
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx6, align 1, !dbg !53
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay7), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_15_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
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
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_15_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_15_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !87
  store i8* %call, i8** %dataBuffer, align 8, !dbg !86
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  %cmp = icmp eq i8* %0, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !95
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  store i8* %3, i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !103
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx1, align 1, !dbg !105
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !109
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !110
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx6, align 1, !dbg !112
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @printLine(i8* %arraydecay7), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i8* null, i8** %data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !120, metadata !DIExpression()), !dbg !122
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !123
  store i8* %call, i8** %dataBuffer, align 8, !dbg !122
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  %cmp = icmp eq i8* %0, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !131
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !134
  store i8* %3, i8** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !139
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx1, align 1, !dbg !141
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  %4 = load i8*, i8** %data, align 8, !dbg !143
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !145
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !146
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !147
  store i8 0, i8* %arrayidx6, align 1, !dbg !148
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !149
  call void @printLine(i8* %arraydecay7), !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 31, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!23 = !DILocation(line: 31, column: 16, scope: !22)
!24 = !DILocation(line: 31, column: 37, scope: !22)
!25 = !DILocation(line: 32, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 32, column: 13)
!27 = !DILocation(line: 32, column: 24, scope: !26)
!28 = !DILocation(line: 32, column: 13, scope: !22)
!29 = !DILocation(line: 32, column: 34, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 32, column: 33)
!31 = !DILocation(line: 33, column: 16, scope: !22)
!32 = !DILocation(line: 33, column: 9, scope: !22)
!33 = !DILocation(line: 34, column: 9, scope: !22)
!34 = !DILocation(line: 34, column: 27, scope: !22)
!35 = !DILocation(line: 36, column: 16, scope: !22)
!36 = !DILocation(line: 36, column: 27, scope: !22)
!37 = !DILocation(line: 36, column: 14, scope: !22)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 45, column: 14, scope: !39)
!44 = !DILocation(line: 46, column: 9, scope: !39)
!45 = !DILocation(line: 47, column: 9, scope: !39)
!46 = !DILocation(line: 47, column: 21, scope: !39)
!47 = !DILocation(line: 49, column: 17, scope: !39)
!48 = !DILocation(line: 49, column: 23, scope: !39)
!49 = !DILocation(line: 49, column: 36, scope: !39)
!50 = !DILocation(line: 49, column: 29, scope: !39)
!51 = !DILocation(line: 49, column: 9, scope: !39)
!52 = !DILocation(line: 51, column: 9, scope: !39)
!53 = !DILocation(line: 51, column: 21, scope: !39)
!54 = !DILocation(line: 52, column: 19, scope: !39)
!55 = !DILocation(line: 52, column: 9, scope: !39)
!56 = !DILocation(line: 56, column: 1, scope: !14)
!57 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_15_good", scope: !15, file: !15, line: 134, type: !16, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 136, column: 5, scope: !57)
!59 = !DILocation(line: 137, column: 5, scope: !57)
!60 = !DILocation(line: 138, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 150, type: !62, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !15, line: 150, type: !64)
!67 = !DILocation(line: 150, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !15, line: 150, type: !65)
!69 = !DILocation(line: 150, column: 27, scope: !61)
!70 = !DILocation(line: 153, column: 22, scope: !61)
!71 = !DILocation(line: 153, column: 12, scope: !61)
!72 = !DILocation(line: 153, column: 5, scope: !61)
!73 = !DILocation(line: 155, column: 5, scope: !61)
!74 = !DILocation(line: 156, column: 5, scope: !61)
!75 = !DILocation(line: 157, column: 5, scope: !61)
!76 = !DILocation(line: 160, column: 5, scope: !61)
!77 = !DILocation(line: 161, column: 5, scope: !61)
!78 = !DILocation(line: 162, column: 5, scope: !61)
!79 = !DILocation(line: 164, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 65, type: !4)
!82 = !DILocation(line: 65, column: 12, scope: !80)
!83 = !DILocation(line: 66, column: 10, scope: !80)
!84 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !15, line: 75, type: !4)
!85 = distinct !DILexicalBlock(scope: !80, file: !15, line: 74, column: 5)
!86 = !DILocation(line: 75, column: 16, scope: !85)
!87 = !DILocation(line: 75, column: 37, scope: !85)
!88 = !DILocation(line: 76, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 76, column: 13)
!90 = !DILocation(line: 76, column: 24, scope: !89)
!91 = !DILocation(line: 76, column: 13, scope: !85)
!92 = !DILocation(line: 76, column: 34, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 76, column: 33)
!94 = !DILocation(line: 77, column: 16, scope: !85)
!95 = !DILocation(line: 77, column: 9, scope: !85)
!96 = !DILocation(line: 78, column: 9, scope: !85)
!97 = !DILocation(line: 78, column: 27, scope: !85)
!98 = !DILocation(line: 80, column: 16, scope: !85)
!99 = !DILocation(line: 80, column: 14, scope: !85)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !15, line: 85, type: !40)
!101 = distinct !DILexicalBlock(scope: !80, file: !15, line: 84, column: 5)
!102 = !DILocation(line: 85, column: 14, scope: !101)
!103 = !DILocation(line: 86, column: 9, scope: !101)
!104 = !DILocation(line: 87, column: 9, scope: !101)
!105 = !DILocation(line: 87, column: 21, scope: !101)
!106 = !DILocation(line: 89, column: 17, scope: !101)
!107 = !DILocation(line: 89, column: 23, scope: !101)
!108 = !DILocation(line: 89, column: 36, scope: !101)
!109 = !DILocation(line: 89, column: 29, scope: !101)
!110 = !DILocation(line: 89, column: 9, scope: !101)
!111 = !DILocation(line: 91, column: 9, scope: !101)
!112 = !DILocation(line: 91, column: 21, scope: !101)
!113 = !DILocation(line: 92, column: 19, scope: !101)
!114 = !DILocation(line: 92, column: 9, scope: !101)
!115 = !DILocation(line: 96, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 101, type: !4)
!118 = !DILocation(line: 101, column: 12, scope: !116)
!119 = !DILocation(line: 102, column: 10, scope: !116)
!120 = !DILocalVariable(name: "dataBuffer", scope: !121, file: !15, line: 107, type: !4)
!121 = distinct !DILexicalBlock(scope: !116, file: !15, line: 106, column: 5)
!122 = !DILocation(line: 107, column: 16, scope: !121)
!123 = !DILocation(line: 107, column: 37, scope: !121)
!124 = !DILocation(line: 108, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 108, column: 13)
!126 = !DILocation(line: 108, column: 24, scope: !125)
!127 = !DILocation(line: 108, column: 13, scope: !121)
!128 = !DILocation(line: 108, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 108, column: 33)
!130 = !DILocation(line: 109, column: 16, scope: !121)
!131 = !DILocation(line: 109, column: 9, scope: !121)
!132 = !DILocation(line: 110, column: 9, scope: !121)
!133 = !DILocation(line: 110, column: 27, scope: !121)
!134 = !DILocation(line: 112, column: 16, scope: !121)
!135 = !DILocation(line: 112, column: 14, scope: !121)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !15, line: 121, type: !40)
!137 = distinct !DILexicalBlock(scope: !116, file: !15, line: 120, column: 5)
!138 = !DILocation(line: 121, column: 14, scope: !137)
!139 = !DILocation(line: 122, column: 9, scope: !137)
!140 = !DILocation(line: 123, column: 9, scope: !137)
!141 = !DILocation(line: 123, column: 21, scope: !137)
!142 = !DILocation(line: 125, column: 17, scope: !137)
!143 = !DILocation(line: 125, column: 23, scope: !137)
!144 = !DILocation(line: 125, column: 36, scope: !137)
!145 = !DILocation(line: 125, column: 29, scope: !137)
!146 = !DILocation(line: 125, column: 9, scope: !137)
!147 = !DILocation(line: 127, column: 9, scope: !137)
!148 = !DILocation(line: 127, column: 21, scope: !137)
!149 = !DILocation(line: 128, column: 19, scope: !137)
!150 = !DILocation(line: 128, column: 9, scope: !137)
!151 = !DILocation(line: 132, column: 1, scope: !116)
