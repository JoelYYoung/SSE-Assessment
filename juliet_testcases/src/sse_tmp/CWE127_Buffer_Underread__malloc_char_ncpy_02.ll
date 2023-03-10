; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_02.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_02_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !26
  store i8* %call, i8** %dataBuffer, align 8, !dbg !25
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !52
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !53
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx6, align 1, !dbg !55
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay7), !dbg !57
  ret void, !dbg !58
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
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_02_good() #0 !dbg !59 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_02_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_02_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !91
  store i8* %call, i8** %dataBuffer, align 8, !dbg !90
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  %cmp = icmp eq i8* %0, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !99
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %3, i8** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx1, align 1, !dbg !109
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !113
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !114
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx6, align 1, !dbg !116
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  call void @printLine(i8* %arraydecay7), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i8* null, i8** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !124, metadata !DIExpression()), !dbg !128
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !129
  store i8* %call, i8** %dataBuffer, align 8, !dbg !128
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  %cmp = icmp eq i8* %0, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !137
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !138
  store i8 0, i8* %arrayidx, align 1, !dbg !139
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !140
  store i8* %3, i8** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !145
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !146
  store i8 0, i8* %arrayidx1, align 1, !dbg !147
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  %4 = load i8*, i8** %data, align 8, !dbg !149
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !151
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !152
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !153
  store i8 0, i8* %arrayidx6, align 1, !dbg !154
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !155
  call void @printLine(i8* %arraydecay7), !dbg !156
  ret void, !dbg !157
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_02_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 30, type: !4)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 29, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 28, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!25 = !DILocation(line: 30, column: 20, scope: !22)
!26 = !DILocation(line: 30, column: 41, scope: !22)
!27 = !DILocation(line: 31, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !15, line: 31, column: 17)
!29 = !DILocation(line: 31, column: 28, scope: !28)
!30 = !DILocation(line: 31, column: 17, scope: !22)
!31 = !DILocation(line: 31, column: 38, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 37)
!33 = !DILocation(line: 32, column: 20, scope: !22)
!34 = !DILocation(line: 32, column: 13, scope: !22)
!35 = !DILocation(line: 33, column: 13, scope: !22)
!36 = !DILocation(line: 33, column: 31, scope: !22)
!37 = !DILocation(line: 35, column: 20, scope: !22)
!38 = !DILocation(line: 35, column: 31, scope: !22)
!39 = !DILocation(line: 35, column: 18, scope: !22)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !15, line: 39, type: !42)
!41 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 39, column: 14, scope: !41)
!46 = !DILocation(line: 40, column: 9, scope: !41)
!47 = !DILocation(line: 41, column: 9, scope: !41)
!48 = !DILocation(line: 41, column: 21, scope: !41)
!49 = !DILocation(line: 43, column: 17, scope: !41)
!50 = !DILocation(line: 43, column: 23, scope: !41)
!51 = !DILocation(line: 43, column: 36, scope: !41)
!52 = !DILocation(line: 43, column: 29, scope: !41)
!53 = !DILocation(line: 43, column: 9, scope: !41)
!54 = !DILocation(line: 45, column: 9, scope: !41)
!55 = !DILocation(line: 45, column: 21, scope: !41)
!56 = !DILocation(line: 46, column: 19, scope: !41)
!57 = !DILocation(line: 46, column: 9, scope: !41)
!58 = !DILocation(line: 50, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_02_good", scope: !15, file: !15, line: 121, type: !16, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 123, column: 5, scope: !59)
!61 = !DILocation(line: 124, column: 5, scope: !59)
!62 = !DILocation(line: 125, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 137, type: !64, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 137, type: !66)
!69 = !DILocation(line: 137, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 137, type: !67)
!71 = !DILocation(line: 137, column: 27, scope: !63)
!72 = !DILocation(line: 140, column: 22, scope: !63)
!73 = !DILocation(line: 140, column: 12, scope: !63)
!74 = !DILocation(line: 140, column: 5, scope: !63)
!75 = !DILocation(line: 142, column: 5, scope: !63)
!76 = !DILocation(line: 143, column: 5, scope: !63)
!77 = !DILocation(line: 144, column: 5, scope: !63)
!78 = !DILocation(line: 147, column: 5, scope: !63)
!79 = !DILocation(line: 148, column: 5, scope: !63)
!80 = !DILocation(line: 149, column: 5, scope: !63)
!81 = !DILocation(line: 151, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 59, type: !4)
!84 = !DILocation(line: 59, column: 12, scope: !82)
!85 = !DILocation(line: 60, column: 10, scope: !82)
!86 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !15, line: 69, type: !4)
!87 = distinct !DILexicalBlock(scope: !88, file: !15, line: 68, column: 9)
!88 = distinct !DILexicalBlock(scope: !89, file: !15, line: 67, column: 5)
!89 = distinct !DILexicalBlock(scope: !82, file: !15, line: 61, column: 8)
!90 = !DILocation(line: 69, column: 20, scope: !87)
!91 = !DILocation(line: 69, column: 41, scope: !87)
!92 = !DILocation(line: 70, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !15, line: 70, column: 17)
!94 = !DILocation(line: 70, column: 28, scope: !93)
!95 = !DILocation(line: 70, column: 17, scope: !87)
!96 = !DILocation(line: 70, column: 38, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 70, column: 37)
!98 = !DILocation(line: 71, column: 20, scope: !87)
!99 = !DILocation(line: 71, column: 13, scope: !87)
!100 = !DILocation(line: 72, column: 13, scope: !87)
!101 = !DILocation(line: 72, column: 31, scope: !87)
!102 = !DILocation(line: 74, column: 20, scope: !87)
!103 = !DILocation(line: 74, column: 18, scope: !87)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !15, line: 78, type: !42)
!105 = distinct !DILexicalBlock(scope: !82, file: !15, line: 77, column: 5)
!106 = !DILocation(line: 78, column: 14, scope: !105)
!107 = !DILocation(line: 79, column: 9, scope: !105)
!108 = !DILocation(line: 80, column: 9, scope: !105)
!109 = !DILocation(line: 80, column: 21, scope: !105)
!110 = !DILocation(line: 82, column: 17, scope: !105)
!111 = !DILocation(line: 82, column: 23, scope: !105)
!112 = !DILocation(line: 82, column: 36, scope: !105)
!113 = !DILocation(line: 82, column: 29, scope: !105)
!114 = !DILocation(line: 82, column: 9, scope: !105)
!115 = !DILocation(line: 84, column: 9, scope: !105)
!116 = !DILocation(line: 84, column: 21, scope: !105)
!117 = !DILocation(line: 85, column: 19, scope: !105)
!118 = !DILocation(line: 85, column: 9, scope: !105)
!119 = !DILocation(line: 89, column: 1, scope: !82)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !15, line: 94, type: !4)
!122 = !DILocation(line: 94, column: 12, scope: !120)
!123 = !DILocation(line: 95, column: 10, scope: !120)
!124 = !DILocalVariable(name: "dataBuffer", scope: !125, file: !15, line: 99, type: !4)
!125 = distinct !DILexicalBlock(scope: !126, file: !15, line: 98, column: 9)
!126 = distinct !DILexicalBlock(scope: !127, file: !15, line: 97, column: 5)
!127 = distinct !DILexicalBlock(scope: !120, file: !15, line: 96, column: 8)
!128 = !DILocation(line: 99, column: 20, scope: !125)
!129 = !DILocation(line: 99, column: 41, scope: !125)
!130 = !DILocation(line: 100, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !15, line: 100, column: 17)
!132 = !DILocation(line: 100, column: 28, scope: !131)
!133 = !DILocation(line: 100, column: 17, scope: !125)
!134 = !DILocation(line: 100, column: 38, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 100, column: 37)
!136 = !DILocation(line: 101, column: 20, scope: !125)
!137 = !DILocation(line: 101, column: 13, scope: !125)
!138 = !DILocation(line: 102, column: 13, scope: !125)
!139 = !DILocation(line: 102, column: 31, scope: !125)
!140 = !DILocation(line: 104, column: 20, scope: !125)
!141 = !DILocation(line: 104, column: 18, scope: !125)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !15, line: 108, type: !42)
!143 = distinct !DILexicalBlock(scope: !120, file: !15, line: 107, column: 5)
!144 = !DILocation(line: 108, column: 14, scope: !143)
!145 = !DILocation(line: 109, column: 9, scope: !143)
!146 = !DILocation(line: 110, column: 9, scope: !143)
!147 = !DILocation(line: 110, column: 21, scope: !143)
!148 = !DILocation(line: 112, column: 17, scope: !143)
!149 = !DILocation(line: 112, column: 23, scope: !143)
!150 = !DILocation(line: 112, column: 36, scope: !143)
!151 = !DILocation(line: 112, column: 29, scope: !143)
!152 = !DILocation(line: 112, column: 9, scope: !143)
!153 = !DILocation(line: 114, column: 9, scope: !143)
!154 = !DILocation(line: 114, column: 21, scope: !143)
!155 = !DILocation(line: 115, column: 19, scope: !143)
!156 = !DILocation(line: 115, column: 9, scope: !143)
!157 = !DILocation(line: 119, column: 1, scope: !120)
