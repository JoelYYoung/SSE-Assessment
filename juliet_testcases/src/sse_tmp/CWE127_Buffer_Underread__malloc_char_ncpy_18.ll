; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_18.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !27
  store i8* %call, i8** %dataBuffer, align 8, !dbg !26
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !35
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !39
  store i8* %add.ptr, i8** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx1, align 1, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %4 = load i8*, i8** %data, align 8, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !53
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx6, align 1, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @printLine(i8* %arraydecay7), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_18_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
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
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_18_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_18_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  br label %source, !dbg !86

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !87), !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !92
  store i8* %call, i8** %dataBuffer, align 8, !dbg !91
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  %cmp = icmp eq i8* %0, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !100
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  store i8* %3, i8** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx1, align 1, !dbg !110
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !114
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !115
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx6, align 1, !dbg !117
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  call void @printLine(i8* %arraydecay7), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!26 = !DILocation(line: 30, column: 16, scope: !25)
!27 = !DILocation(line: 30, column: 37, scope: !25)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 24, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !25)
!32 = !DILocation(line: 31, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 31, column: 33)
!34 = !DILocation(line: 32, column: 16, scope: !25)
!35 = !DILocation(line: 32, column: 9, scope: !25)
!36 = !DILocation(line: 33, column: 9, scope: !25)
!37 = !DILocation(line: 33, column: 27, scope: !25)
!38 = !DILocation(line: 35, column: 16, scope: !25)
!39 = !DILocation(line: 35, column: 27, scope: !25)
!40 = !DILocation(line: 35, column: 14, scope: !25)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !15, line: 38, type: !43)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 38, column: 14, scope: !42)
!47 = !DILocation(line: 39, column: 9, scope: !42)
!48 = !DILocation(line: 40, column: 9, scope: !42)
!49 = !DILocation(line: 40, column: 21, scope: !42)
!50 = !DILocation(line: 42, column: 17, scope: !42)
!51 = !DILocation(line: 42, column: 23, scope: !42)
!52 = !DILocation(line: 42, column: 36, scope: !42)
!53 = !DILocation(line: 42, column: 29, scope: !42)
!54 = !DILocation(line: 42, column: 9, scope: !42)
!55 = !DILocation(line: 44, column: 9, scope: !42)
!56 = !DILocation(line: 44, column: 21, scope: !42)
!57 = !DILocation(line: 45, column: 19, scope: !42)
!58 = !DILocation(line: 45, column: 9, scope: !42)
!59 = !DILocation(line: 49, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_18_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 86, column: 5, scope: !60)
!62 = !DILocation(line: 87, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !64, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 99, type: !66)
!69 = !DILocation(line: 99, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 99, type: !67)
!71 = !DILocation(line: 99, column: 27, scope: !63)
!72 = !DILocation(line: 102, column: 22, scope: !63)
!73 = !DILocation(line: 102, column: 12, scope: !63)
!74 = !DILocation(line: 102, column: 5, scope: !63)
!75 = !DILocation(line: 104, column: 5, scope: !63)
!76 = !DILocation(line: 105, column: 5, scope: !63)
!77 = !DILocation(line: 106, column: 5, scope: !63)
!78 = !DILocation(line: 109, column: 5, scope: !63)
!79 = !DILocation(line: 110, column: 5, scope: !63)
!80 = !DILocation(line: 111, column: 5, scope: !63)
!81 = !DILocation(line: 113, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 58, type: !4)
!84 = !DILocation(line: 58, column: 12, scope: !82)
!85 = !DILocation(line: 59, column: 10, scope: !82)
!86 = !DILocation(line: 60, column: 5, scope: !82)
!87 = !DILabel(scope: !82, name: "source", file: !15, line: 61)
!88 = !DILocation(line: 61, column: 1, scope: !82)
!89 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !15, line: 63, type: !4)
!90 = distinct !DILexicalBlock(scope: !82, file: !15, line: 62, column: 5)
!91 = !DILocation(line: 63, column: 16, scope: !90)
!92 = !DILocation(line: 63, column: 37, scope: !90)
!93 = !DILocation(line: 64, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 64, column: 13)
!95 = !DILocation(line: 64, column: 24, scope: !94)
!96 = !DILocation(line: 64, column: 13, scope: !90)
!97 = !DILocation(line: 64, column: 34, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 64, column: 33)
!99 = !DILocation(line: 65, column: 16, scope: !90)
!100 = !DILocation(line: 65, column: 9, scope: !90)
!101 = !DILocation(line: 66, column: 9, scope: !90)
!102 = !DILocation(line: 66, column: 27, scope: !90)
!103 = !DILocation(line: 68, column: 16, scope: !90)
!104 = !DILocation(line: 68, column: 14, scope: !90)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !15, line: 71, type: !43)
!106 = distinct !DILexicalBlock(scope: !82, file: !15, line: 70, column: 5)
!107 = !DILocation(line: 71, column: 14, scope: !106)
!108 = !DILocation(line: 72, column: 9, scope: !106)
!109 = !DILocation(line: 73, column: 9, scope: !106)
!110 = !DILocation(line: 73, column: 21, scope: !106)
!111 = !DILocation(line: 75, column: 17, scope: !106)
!112 = !DILocation(line: 75, column: 23, scope: !106)
!113 = !DILocation(line: 75, column: 36, scope: !106)
!114 = !DILocation(line: 75, column: 29, scope: !106)
!115 = !DILocation(line: 75, column: 9, scope: !106)
!116 = !DILocation(line: 77, column: 9, scope: !106)
!117 = !DILocation(line: 77, column: 21, scope: !106)
!118 = !DILocation(line: 78, column: 19, scope: !106)
!119 = !DILocation(line: 78, column: 9, scope: !106)
!120 = !DILocation(line: 82, column: 1, scope: !82)
