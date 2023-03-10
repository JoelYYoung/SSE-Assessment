; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memmove_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataBuffer3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !28
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !40
  store i8* %add.ptr, i8** %data, align 8, !dbg !41
  br label %if.end9, !dbg !42

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer3, metadata !43, metadata !DIExpression()), !dbg !46
  %call4 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !47
  store i8* %call4, i8** %dataBuffer3, align 8, !dbg !46
  %4 = load i8*, i8** %dataBuffer3, align 8, !dbg !48
  %cmp5 = icmp eq i8* %4, null, !dbg !50
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !51

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !52
  unreachable, !dbg !52

if.end7:                                          ; preds = %if.else
  %5 = load i8*, i8** %dataBuffer3, align 8, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 65, i64 99, i1 false), !dbg !55
  %6 = load i8*, i8** %dataBuffer3, align 8, !dbg !56
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !56
  store i8 0, i8* %arrayidx8, align 1, !dbg !57
  %7 = load i8*, i8** %dataBuffer3, align 8, !dbg !58
  store i8* %7, i8** %data, align 8, !dbg !59
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !60, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !66
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !66
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !67
  store i8 0, i8* %arrayidx10, align 1, !dbg !68
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !69
  %8 = load i8*, i8** %data, align 8, !dbg !70
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay11, i8* align 1 %8, i64 100, i1 false), !dbg !69
  %arrayidx12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !71
  store i8 0, i8* %arrayidx12, align 1, !dbg !72
  %arraydecay13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  call void @printLine(i8* %arraydecay13), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memmove_12_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE127_Buffer_Underread__malloc_char_memmove_12_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE127_Buffer_Underread__malloc_char_memmove_12_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataBuffer3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i8* null, i8** %data, align 8, !dbg !101
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !102
  %tobool = icmp ne i32 %call, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !108
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !109
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !108
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  %cmp = icmp eq i8* %0, null, !dbg !112
  br i1 %cmp, label %if.then2, label %if.end, !dbg !113

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !117
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  store i8* %3, i8** %data, align 8, !dbg !121
  br label %if.end9, !dbg !122

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer3, metadata !123, metadata !DIExpression()), !dbg !126
  %call4 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !127
  store i8* %call4, i8** %dataBuffer3, align 8, !dbg !126
  %4 = load i8*, i8** %dataBuffer3, align 8, !dbg !128
  %cmp5 = icmp eq i8* %4, null, !dbg !130
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !131

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !132
  unreachable, !dbg !132

if.end7:                                          ; preds = %if.else
  %5 = load i8*, i8** %dataBuffer3, align 8, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 65, i64 99, i1 false), !dbg !135
  %6 = load i8*, i8** %dataBuffer3, align 8, !dbg !136
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !136
  store i8 0, i8* %arrayidx8, align 1, !dbg !137
  %7 = load i8*, i8** %dataBuffer3, align 8, !dbg !138
  store i8* %7, i8** %data, align 8, !dbg !139
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !140, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !143
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !144
  store i8 0, i8* %arrayidx10, align 1, !dbg !145
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !146
  %8 = load i8*, i8** %data, align 8, !dbg !147
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay11, i8* align 1 %8, i64 100, i1 false), !dbg !146
  %arrayidx12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx12, align 1, !dbg !149
  %arraydecay13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  call void @printLine(i8* %arraydecay13), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memmove_12_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 41, scope: !25)
!29 = !DILocation(line: 31, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 17)
!31 = !DILocation(line: 31, column: 28, scope: !30)
!32 = !DILocation(line: 31, column: 17, scope: !25)
!33 = !DILocation(line: 31, column: 38, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 31, column: 37)
!35 = !DILocation(line: 32, column: 20, scope: !25)
!36 = !DILocation(line: 32, column: 13, scope: !25)
!37 = !DILocation(line: 33, column: 13, scope: !25)
!38 = !DILocation(line: 33, column: 31, scope: !25)
!39 = !DILocation(line: 35, column: 20, scope: !25)
!40 = !DILocation(line: 35, column: 31, scope: !25)
!41 = !DILocation(line: 35, column: 18, scope: !25)
!42 = !DILocation(line: 37, column: 5, scope: !26)
!43 = !DILocalVariable(name: "dataBuffer", scope: !44, file: !15, line: 41, type: !4)
!44 = distinct !DILexicalBlock(scope: !45, file: !15, line: 40, column: 9)
!45 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 5)
!46 = !DILocation(line: 41, column: 20, scope: !44)
!47 = !DILocation(line: 41, column: 41, scope: !44)
!48 = !DILocation(line: 42, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !15, line: 42, column: 17)
!50 = !DILocation(line: 42, column: 28, scope: !49)
!51 = !DILocation(line: 42, column: 17, scope: !44)
!52 = !DILocation(line: 42, column: 38, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 42, column: 37)
!54 = !DILocation(line: 43, column: 20, scope: !44)
!55 = !DILocation(line: 43, column: 13, scope: !44)
!56 = !DILocation(line: 44, column: 13, scope: !44)
!57 = !DILocation(line: 44, column: 31, scope: !44)
!58 = !DILocation(line: 46, column: 20, scope: !44)
!59 = !DILocation(line: 46, column: 18, scope: !44)
!60 = !DILocalVariable(name: "dest", scope: !61, file: !15, line: 50, type: !62)
!61 = distinct !DILexicalBlock(scope: !14, file: !15, line: 49, column: 5)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 100)
!65 = !DILocation(line: 50, column: 14, scope: !61)
!66 = !DILocation(line: 51, column: 9, scope: !61)
!67 = !DILocation(line: 52, column: 9, scope: !61)
!68 = !DILocation(line: 52, column: 21, scope: !61)
!69 = !DILocation(line: 54, column: 9, scope: !61)
!70 = !DILocation(line: 54, column: 23, scope: !61)
!71 = !DILocation(line: 56, column: 9, scope: !61)
!72 = !DILocation(line: 56, column: 21, scope: !61)
!73 = !DILocation(line: 57, column: 19, scope: !61)
!74 = !DILocation(line: 57, column: 9, scope: !61)
!75 = !DILocation(line: 61, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memmove_12_good", scope: !15, file: !15, line: 109, type: !16, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 111, column: 5, scope: !76)
!78 = !DILocation(line: 112, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 124, type: !80, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !15, line: 124, type: !82)
!85 = !DILocation(line: 124, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !15, line: 124, type: !83)
!87 = !DILocation(line: 124, column: 27, scope: !79)
!88 = !DILocation(line: 127, column: 22, scope: !79)
!89 = !DILocation(line: 127, column: 12, scope: !79)
!90 = !DILocation(line: 127, column: 5, scope: !79)
!91 = !DILocation(line: 129, column: 5, scope: !79)
!92 = !DILocation(line: 130, column: 5, scope: !79)
!93 = !DILocation(line: 131, column: 5, scope: !79)
!94 = !DILocation(line: 134, column: 5, scope: !79)
!95 = !DILocation(line: 135, column: 5, scope: !79)
!96 = !DILocation(line: 136, column: 5, scope: !79)
!97 = !DILocation(line: 138, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 69, type: !16, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 71, type: !4)
!100 = !DILocation(line: 71, column: 12, scope: !98)
!101 = !DILocation(line: 72, column: 10, scope: !98)
!102 = !DILocation(line: 73, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !15, line: 73, column: 8)
!104 = !DILocation(line: 73, column: 8, scope: !98)
!105 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !15, line: 76, type: !4)
!106 = distinct !DILexicalBlock(scope: !107, file: !15, line: 75, column: 9)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 74, column: 5)
!108 = !DILocation(line: 76, column: 20, scope: !106)
!109 = !DILocation(line: 76, column: 41, scope: !106)
!110 = !DILocation(line: 77, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !15, line: 77, column: 17)
!112 = !DILocation(line: 77, column: 28, scope: !111)
!113 = !DILocation(line: 77, column: 17, scope: !106)
!114 = !DILocation(line: 77, column: 38, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 77, column: 37)
!116 = !DILocation(line: 78, column: 20, scope: !106)
!117 = !DILocation(line: 78, column: 13, scope: !106)
!118 = !DILocation(line: 79, column: 13, scope: !106)
!119 = !DILocation(line: 79, column: 31, scope: !106)
!120 = !DILocation(line: 81, column: 20, scope: !106)
!121 = !DILocation(line: 81, column: 18, scope: !106)
!122 = !DILocation(line: 83, column: 5, scope: !107)
!123 = !DILocalVariable(name: "dataBuffer", scope: !124, file: !15, line: 87, type: !4)
!124 = distinct !DILexicalBlock(scope: !125, file: !15, line: 86, column: 9)
!125 = distinct !DILexicalBlock(scope: !103, file: !15, line: 85, column: 5)
!126 = !DILocation(line: 87, column: 20, scope: !124)
!127 = !DILocation(line: 87, column: 41, scope: !124)
!128 = !DILocation(line: 88, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !15, line: 88, column: 17)
!130 = !DILocation(line: 88, column: 28, scope: !129)
!131 = !DILocation(line: 88, column: 17, scope: !124)
!132 = !DILocation(line: 88, column: 38, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 88, column: 37)
!134 = !DILocation(line: 89, column: 20, scope: !124)
!135 = !DILocation(line: 89, column: 13, scope: !124)
!136 = !DILocation(line: 90, column: 13, scope: !124)
!137 = !DILocation(line: 90, column: 31, scope: !124)
!138 = !DILocation(line: 92, column: 20, scope: !124)
!139 = !DILocation(line: 92, column: 18, scope: !124)
!140 = !DILocalVariable(name: "dest", scope: !141, file: !15, line: 96, type: !62)
!141 = distinct !DILexicalBlock(scope: !98, file: !15, line: 95, column: 5)
!142 = !DILocation(line: 96, column: 14, scope: !141)
!143 = !DILocation(line: 97, column: 9, scope: !141)
!144 = !DILocation(line: 98, column: 9, scope: !141)
!145 = !DILocation(line: 98, column: 21, scope: !141)
!146 = !DILocation(line: 100, column: 9, scope: !141)
!147 = !DILocation(line: 100, column: 23, scope: !141)
!148 = !DILocation(line: 102, column: 9, scope: !141)
!149 = !DILocation(line: 102, column: 21, scope: !141)
!150 = !DILocation(line: 103, column: 19, scope: !141)
!151 = !DILocation(line: 103, column: 9, scope: !141)
!152 = !DILocation(line: 107, column: 1, scope: !98)
