; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx1, align 1, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #6, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %6), !dbg !53
  ret void, !dbg !54
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

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_15_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
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
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_15_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_15_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !85
  store i8* %call, i8** %dataBuffer, align 8, !dbg !84
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq i8* %0, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !93
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  store i8* %3, i8** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx1, align 1, !dbg !103
  %4 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #6, !dbg !106
  %5 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %6 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %6), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i8* null, i8** %data, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !118
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !119
  store i8* %call, i8** %dataBuffer, align 8, !dbg !118
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  %cmp = icmp eq i8* %0, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !127
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  store i8* %3, i8** %data, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !135
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx1, align 1, !dbg !137
  %4 = load i8*, i8** %data, align 8, !dbg !138
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !139
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #6, !dbg !140
  %5 = load i8*, i8** %data, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !141
  store i8 0, i8* %arrayidx4, align 1, !dbg !142
  %6 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* %6), !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!38 = !DILocalVariable(name: "source", scope: !39, file: !15, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 45, column: 14, scope: !39)
!44 = !DILocation(line: 46, column: 9, scope: !39)
!45 = !DILocation(line: 47, column: 9, scope: !39)
!46 = !DILocation(line: 47, column: 23, scope: !39)
!47 = !DILocation(line: 49, column: 17, scope: !39)
!48 = !DILocation(line: 49, column: 23, scope: !39)
!49 = !DILocation(line: 49, column: 9, scope: !39)
!50 = !DILocation(line: 51, column: 9, scope: !39)
!51 = !DILocation(line: 51, column: 21, scope: !39)
!52 = !DILocation(line: 52, column: 19, scope: !39)
!53 = !DILocation(line: 52, column: 9, scope: !39)
!54 = !DILocation(line: 56, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_15_good", scope: !15, file: !15, line: 134, type: !16, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 136, column: 5, scope: !55)
!57 = !DILocation(line: 137, column: 5, scope: !55)
!58 = !DILocation(line: 138, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 150, type: !60, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 150, type: !62)
!65 = !DILocation(line: 150, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 150, type: !63)
!67 = !DILocation(line: 150, column: 27, scope: !59)
!68 = !DILocation(line: 153, column: 22, scope: !59)
!69 = !DILocation(line: 153, column: 12, scope: !59)
!70 = !DILocation(line: 153, column: 5, scope: !59)
!71 = !DILocation(line: 155, column: 5, scope: !59)
!72 = !DILocation(line: 156, column: 5, scope: !59)
!73 = !DILocation(line: 157, column: 5, scope: !59)
!74 = !DILocation(line: 160, column: 5, scope: !59)
!75 = !DILocation(line: 161, column: 5, scope: !59)
!76 = !DILocation(line: 162, column: 5, scope: !59)
!77 = !DILocation(line: 164, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 65, type: !4)
!80 = !DILocation(line: 65, column: 12, scope: !78)
!81 = !DILocation(line: 66, column: 10, scope: !78)
!82 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !15, line: 75, type: !4)
!83 = distinct !DILexicalBlock(scope: !78, file: !15, line: 74, column: 5)
!84 = !DILocation(line: 75, column: 16, scope: !83)
!85 = !DILocation(line: 75, column: 37, scope: !83)
!86 = !DILocation(line: 76, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 76, column: 13)
!88 = !DILocation(line: 76, column: 24, scope: !87)
!89 = !DILocation(line: 76, column: 13, scope: !83)
!90 = !DILocation(line: 76, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 76, column: 33)
!92 = !DILocation(line: 77, column: 16, scope: !83)
!93 = !DILocation(line: 77, column: 9, scope: !83)
!94 = !DILocation(line: 78, column: 9, scope: !83)
!95 = !DILocation(line: 78, column: 27, scope: !83)
!96 = !DILocation(line: 80, column: 16, scope: !83)
!97 = !DILocation(line: 80, column: 14, scope: !83)
!98 = !DILocalVariable(name: "source", scope: !99, file: !15, line: 85, type: !40)
!99 = distinct !DILexicalBlock(scope: !78, file: !15, line: 84, column: 5)
!100 = !DILocation(line: 85, column: 14, scope: !99)
!101 = !DILocation(line: 86, column: 9, scope: !99)
!102 = !DILocation(line: 87, column: 9, scope: !99)
!103 = !DILocation(line: 87, column: 23, scope: !99)
!104 = !DILocation(line: 89, column: 17, scope: !99)
!105 = !DILocation(line: 89, column: 23, scope: !99)
!106 = !DILocation(line: 89, column: 9, scope: !99)
!107 = !DILocation(line: 91, column: 9, scope: !99)
!108 = !DILocation(line: 91, column: 21, scope: !99)
!109 = !DILocation(line: 92, column: 19, scope: !99)
!110 = !DILocation(line: 92, column: 9, scope: !99)
!111 = !DILocation(line: 96, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 101, type: !4)
!114 = !DILocation(line: 101, column: 12, scope: !112)
!115 = !DILocation(line: 102, column: 10, scope: !112)
!116 = !DILocalVariable(name: "dataBuffer", scope: !117, file: !15, line: 107, type: !4)
!117 = distinct !DILexicalBlock(scope: !112, file: !15, line: 106, column: 5)
!118 = !DILocation(line: 107, column: 16, scope: !117)
!119 = !DILocation(line: 107, column: 37, scope: !117)
!120 = !DILocation(line: 108, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 108, column: 13)
!122 = !DILocation(line: 108, column: 24, scope: !121)
!123 = !DILocation(line: 108, column: 13, scope: !117)
!124 = !DILocation(line: 108, column: 34, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 108, column: 33)
!126 = !DILocation(line: 109, column: 16, scope: !117)
!127 = !DILocation(line: 109, column: 9, scope: !117)
!128 = !DILocation(line: 110, column: 9, scope: !117)
!129 = !DILocation(line: 110, column: 27, scope: !117)
!130 = !DILocation(line: 112, column: 16, scope: !117)
!131 = !DILocation(line: 112, column: 14, scope: !117)
!132 = !DILocalVariable(name: "source", scope: !133, file: !15, line: 121, type: !40)
!133 = distinct !DILexicalBlock(scope: !112, file: !15, line: 120, column: 5)
!134 = !DILocation(line: 121, column: 14, scope: !133)
!135 = !DILocation(line: 122, column: 9, scope: !133)
!136 = !DILocation(line: 123, column: 9, scope: !133)
!137 = !DILocation(line: 123, column: 23, scope: !133)
!138 = !DILocation(line: 125, column: 17, scope: !133)
!139 = !DILocation(line: 125, column: 23, scope: !133)
!140 = !DILocation(line: 125, column: 9, scope: !133)
!141 = !DILocation(line: 127, column: 9, scope: !133)
!142 = !DILocation(line: 127, column: 21, scope: !133)
!143 = !DILocation(line: 128, column: 19, scope: !133)
!144 = !DILocation(line: 128, column: 9, scope: !133)
!145 = !DILocation(line: 132, column: 1, scope: !112)
