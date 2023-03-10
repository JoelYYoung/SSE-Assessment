; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_16.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !26
  store i8* %call, i8** %dataBuffer, align 8, !dbg !25
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  br label %while.end, !dbg !40

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !47
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !48
  store i8 0, i8* %arrayidx1, align 1, !dbg !49
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !50
  %4 = load i8*, i8** %data, align 8, !dbg !51
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %4) #6, !dbg !52
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @printLine(i8* %arraydecay4), !dbg !54
  ret void, !dbg !55
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
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_16_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__malloc_char_cpy_16_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__malloc_char_cpy_16_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  br label %while.body, !dbg !82

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !87
  store i8* %call, i8** %dataBuffer, align 8, !dbg !86
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  %cmp = icmp eq i8* %0, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !95
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  store i8* %3, i8** %data, align 8, !dbg !99
  br label %while.end, !dbg !100

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !104
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !105
  store i8 0, i8* %arrayidx1, align 1, !dbg !106
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %4) #6, !dbg !109
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @printLine(i8* %arraydecay4), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_16_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !15, line: 30, type: !4)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 9)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!25 = !DILocation(line: 30, column: 20, scope: !23)
!26 = !DILocation(line: 30, column: 41, scope: !23)
!27 = !DILocation(line: 31, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 17)
!29 = !DILocation(line: 31, column: 28, scope: !28)
!30 = !DILocation(line: 31, column: 17, scope: !23)
!31 = !DILocation(line: 31, column: 38, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 37)
!33 = !DILocation(line: 32, column: 20, scope: !23)
!34 = !DILocation(line: 32, column: 13, scope: !23)
!35 = !DILocation(line: 33, column: 13, scope: !23)
!36 = !DILocation(line: 33, column: 31, scope: !23)
!37 = !DILocation(line: 35, column: 20, scope: !23)
!38 = !DILocation(line: 35, column: 31, scope: !23)
!39 = !DILocation(line: 35, column: 18, scope: !23)
!40 = !DILocation(line: 37, column: 9, scope: !24)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !15, line: 40, type: !43)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 200)
!46 = !DILocation(line: 40, column: 14, scope: !42)
!47 = !DILocation(line: 41, column: 9, scope: !42)
!48 = !DILocation(line: 42, column: 9, scope: !42)
!49 = !DILocation(line: 42, column: 23, scope: !42)
!50 = !DILocation(line: 44, column: 16, scope: !42)
!51 = !DILocation(line: 44, column: 22, scope: !42)
!52 = !DILocation(line: 44, column: 9, scope: !42)
!53 = !DILocation(line: 45, column: 19, scope: !42)
!54 = !DILocation(line: 45, column: 9, scope: !42)
!55 = !DILocation(line: 49, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_16_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 86, column: 5, scope: !56)
!58 = !DILocation(line: 87, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !60, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 99, type: !62)
!65 = !DILocation(line: 99, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 99, type: !63)
!67 = !DILocation(line: 99, column: 27, scope: !59)
!68 = !DILocation(line: 102, column: 22, scope: !59)
!69 = !DILocation(line: 102, column: 12, scope: !59)
!70 = !DILocation(line: 102, column: 5, scope: !59)
!71 = !DILocation(line: 104, column: 5, scope: !59)
!72 = !DILocation(line: 105, column: 5, scope: !59)
!73 = !DILocation(line: 106, column: 5, scope: !59)
!74 = !DILocation(line: 109, column: 5, scope: !59)
!75 = !DILocation(line: 110, column: 5, scope: !59)
!76 = !DILocation(line: 111, column: 5, scope: !59)
!77 = !DILocation(line: 113, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 58, type: !4)
!80 = !DILocation(line: 58, column: 12, scope: !78)
!81 = !DILocation(line: 59, column: 10, scope: !78)
!82 = !DILocation(line: 60, column: 5, scope: !78)
!83 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !15, line: 63, type: !4)
!84 = distinct !DILexicalBlock(scope: !85, file: !15, line: 62, column: 9)
!85 = distinct !DILexicalBlock(scope: !78, file: !15, line: 61, column: 5)
!86 = !DILocation(line: 63, column: 20, scope: !84)
!87 = !DILocation(line: 63, column: 41, scope: !84)
!88 = !DILocation(line: 64, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !15, line: 64, column: 17)
!90 = !DILocation(line: 64, column: 28, scope: !89)
!91 = !DILocation(line: 64, column: 17, scope: !84)
!92 = !DILocation(line: 64, column: 38, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 64, column: 37)
!94 = !DILocation(line: 65, column: 20, scope: !84)
!95 = !DILocation(line: 65, column: 13, scope: !84)
!96 = !DILocation(line: 66, column: 13, scope: !84)
!97 = !DILocation(line: 66, column: 31, scope: !84)
!98 = !DILocation(line: 68, column: 20, scope: !84)
!99 = !DILocation(line: 68, column: 18, scope: !84)
!100 = !DILocation(line: 70, column: 9, scope: !85)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !15, line: 73, type: !43)
!102 = distinct !DILexicalBlock(scope: !78, file: !15, line: 72, column: 5)
!103 = !DILocation(line: 73, column: 14, scope: !102)
!104 = !DILocation(line: 74, column: 9, scope: !102)
!105 = !DILocation(line: 75, column: 9, scope: !102)
!106 = !DILocation(line: 75, column: 23, scope: !102)
!107 = !DILocation(line: 77, column: 16, scope: !102)
!108 = !DILocation(line: 77, column: 22, scope: !102)
!109 = !DILocation(line: 77, column: 9, scope: !102)
!110 = !DILocation(line: 78, column: 19, scope: !102)
!111 = !DILocation(line: 78, column: 9, scope: !102)
!112 = !DILocation(line: 82, column: 1, scope: !78)
