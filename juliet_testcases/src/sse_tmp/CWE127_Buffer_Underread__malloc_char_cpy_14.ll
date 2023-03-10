; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_14.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !29
  store i8* %call, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %cmp1 = icmp eq i8* %1, null, !dbg !32
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !37
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !41
  store i8* %add.ptr, i8** %data, align 8, !dbg !42
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !50
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !51
  store i8 0, i8* %arrayidx4, align 1, !dbg !52
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !53
  %5 = load i8*, i8** %data, align 8, !dbg !54
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %5) #6, !dbg !55
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !56
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
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_14_good() #0 !dbg !59 {
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
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__malloc_char_cpy_14_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__malloc_char_cpy_14_bad(), !dbg !79
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
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  %0 = load i32, i32* @globalFive, align 4, !dbg !86
  %cmp = icmp ne i32 %0, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end3, !dbg !92

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !97
  store i8* %call, i8** %dataBuffer, align 8, !dbg !96
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  %cmp1 = icmp eq i8* %1, null, !dbg !100
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !101

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !105
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  store i8* %4, i8** %data, align 8, !dbg !109
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !113
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !114
  store i8 0, i8* %arrayidx4, align 1, !dbg !115
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !116
  %5 = load i8*, i8** %data, align 8, !dbg !117
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %5) #6, !dbg !118
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !119
  call void @printLine(i8* %arraydecay7), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !122 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i8* null, i8** %data, align 8, !dbg !125
  %0 = load i32, i32* @globalFive, align 4, !dbg !126
  %cmp = icmp eq i32 %0, 5, !dbg !128
  br i1 %cmp, label %if.then, label %if.end3, !dbg !129

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !130, metadata !DIExpression()), !dbg !133
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !134
  store i8* %call, i8** %dataBuffer, align 8, !dbg !133
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !135
  %cmp1 = icmp eq i8* %1, null, !dbg !137
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !138

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !142
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !143
  store i8 0, i8* %arrayidx, align 1, !dbg !144
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !145
  store i8* %4, i8** %data, align 8, !dbg !146
  br label %if.end3, !dbg !147

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !148, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !151
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !152
  store i8 0, i8* %arrayidx4, align 1, !dbg !153
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !154
  %5 = load i8*, i8** %data, align 8, !dbg !155
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %5) #6, !dbg !156
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @printLine(i8* %arraydecay7), !dbg !158
  ret void, !dbg !159
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_14_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 18, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !15, line: 30, type: !4)
!26 = distinct !DILexicalBlock(scope: !27, file: !15, line: 29, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 20, scope: !26)
!29 = !DILocation(line: 30, column: 41, scope: !26)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 17)
!32 = !DILocation(line: 31, column: 28, scope: !31)
!33 = !DILocation(line: 31, column: 17, scope: !26)
!34 = !DILocation(line: 31, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 31, column: 37)
!36 = !DILocation(line: 32, column: 20, scope: !26)
!37 = !DILocation(line: 32, column: 13, scope: !26)
!38 = !DILocation(line: 33, column: 13, scope: !26)
!39 = !DILocation(line: 33, column: 31, scope: !26)
!40 = !DILocation(line: 35, column: 20, scope: !26)
!41 = !DILocation(line: 35, column: 31, scope: !26)
!42 = !DILocation(line: 35, column: 18, scope: !26)
!43 = !DILocation(line: 37, column: 5, scope: !27)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !15, line: 39, type: !46)
!45 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 200)
!49 = !DILocation(line: 39, column: 14, scope: !45)
!50 = !DILocation(line: 40, column: 9, scope: !45)
!51 = !DILocation(line: 41, column: 9, scope: !45)
!52 = !DILocation(line: 41, column: 23, scope: !45)
!53 = !DILocation(line: 43, column: 16, scope: !45)
!54 = !DILocation(line: 43, column: 22, scope: !45)
!55 = !DILocation(line: 43, column: 9, scope: !45)
!56 = !DILocation(line: 44, column: 19, scope: !45)
!57 = !DILocation(line: 44, column: 9, scope: !45)
!58 = !DILocation(line: 48, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_14_good", scope: !15, file: !15, line: 115, type: !16, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 117, column: 5, scope: !59)
!61 = !DILocation(line: 118, column: 5, scope: !59)
!62 = !DILocation(line: 119, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 131, type: !64, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 131, type: !66)
!69 = !DILocation(line: 131, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 131, type: !67)
!71 = !DILocation(line: 131, column: 27, scope: !63)
!72 = !DILocation(line: 134, column: 22, scope: !63)
!73 = !DILocation(line: 134, column: 12, scope: !63)
!74 = !DILocation(line: 134, column: 5, scope: !63)
!75 = !DILocation(line: 136, column: 5, scope: !63)
!76 = !DILocation(line: 137, column: 5, scope: !63)
!77 = !DILocation(line: 138, column: 5, scope: !63)
!78 = !DILocation(line: 141, column: 5, scope: !63)
!79 = !DILocation(line: 142, column: 5, scope: !63)
!80 = !DILocation(line: 143, column: 5, scope: !63)
!81 = !DILocation(line: 145, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 57, type: !4)
!84 = !DILocation(line: 57, column: 12, scope: !82)
!85 = !DILocation(line: 58, column: 10, scope: !82)
!86 = !DILocation(line: 59, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !15, line: 59, column: 8)
!88 = !DILocation(line: 59, column: 18, scope: !87)
!89 = !DILocation(line: 59, column: 8, scope: !82)
!90 = !DILocation(line: 62, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 60, column: 5)
!92 = !DILocation(line: 63, column: 5, scope: !91)
!93 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !15, line: 67, type: !4)
!94 = distinct !DILexicalBlock(scope: !95, file: !15, line: 66, column: 9)
!95 = distinct !DILexicalBlock(scope: !87, file: !15, line: 65, column: 5)
!96 = !DILocation(line: 67, column: 20, scope: !94)
!97 = !DILocation(line: 67, column: 41, scope: !94)
!98 = !DILocation(line: 68, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !15, line: 68, column: 17)
!100 = !DILocation(line: 68, column: 28, scope: !99)
!101 = !DILocation(line: 68, column: 17, scope: !94)
!102 = !DILocation(line: 68, column: 38, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 68, column: 37)
!104 = !DILocation(line: 69, column: 20, scope: !94)
!105 = !DILocation(line: 69, column: 13, scope: !94)
!106 = !DILocation(line: 70, column: 13, scope: !94)
!107 = !DILocation(line: 70, column: 31, scope: !94)
!108 = !DILocation(line: 72, column: 20, scope: !94)
!109 = !DILocation(line: 72, column: 18, scope: !94)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !15, line: 76, type: !46)
!111 = distinct !DILexicalBlock(scope: !82, file: !15, line: 75, column: 5)
!112 = !DILocation(line: 76, column: 14, scope: !111)
!113 = !DILocation(line: 77, column: 9, scope: !111)
!114 = !DILocation(line: 78, column: 9, scope: !111)
!115 = !DILocation(line: 78, column: 23, scope: !111)
!116 = !DILocation(line: 80, column: 16, scope: !111)
!117 = !DILocation(line: 80, column: 22, scope: !111)
!118 = !DILocation(line: 80, column: 9, scope: !111)
!119 = !DILocation(line: 81, column: 19, scope: !111)
!120 = !DILocation(line: 81, column: 9, scope: !111)
!121 = !DILocation(line: 85, column: 1, scope: !82)
!122 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !15, line: 90, type: !4)
!124 = !DILocation(line: 90, column: 12, scope: !122)
!125 = !DILocation(line: 91, column: 10, scope: !122)
!126 = !DILocation(line: 92, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !15, line: 92, column: 8)
!128 = !DILocation(line: 92, column: 18, scope: !127)
!129 = !DILocation(line: 92, column: 8, scope: !122)
!130 = !DILocalVariable(name: "dataBuffer", scope: !131, file: !15, line: 95, type: !4)
!131 = distinct !DILexicalBlock(scope: !132, file: !15, line: 94, column: 9)
!132 = distinct !DILexicalBlock(scope: !127, file: !15, line: 93, column: 5)
!133 = !DILocation(line: 95, column: 20, scope: !131)
!134 = !DILocation(line: 95, column: 41, scope: !131)
!135 = !DILocation(line: 96, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !15, line: 96, column: 17)
!137 = !DILocation(line: 96, column: 28, scope: !136)
!138 = !DILocation(line: 96, column: 17, scope: !131)
!139 = !DILocation(line: 96, column: 38, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 96, column: 37)
!141 = !DILocation(line: 97, column: 20, scope: !131)
!142 = !DILocation(line: 97, column: 13, scope: !131)
!143 = !DILocation(line: 98, column: 13, scope: !131)
!144 = !DILocation(line: 98, column: 31, scope: !131)
!145 = !DILocation(line: 100, column: 20, scope: !131)
!146 = !DILocation(line: 100, column: 18, scope: !131)
!147 = !DILocation(line: 102, column: 5, scope: !132)
!148 = !DILocalVariable(name: "dest", scope: !149, file: !15, line: 104, type: !46)
!149 = distinct !DILexicalBlock(scope: !122, file: !15, line: 103, column: 5)
!150 = !DILocation(line: 104, column: 14, scope: !149)
!151 = !DILocation(line: 105, column: 9, scope: !149)
!152 = !DILocation(line: 106, column: 9, scope: !149)
!153 = !DILocation(line: 106, column: 23, scope: !149)
!154 = !DILocation(line: 108, column: 16, scope: !149)
!155 = !DILocation(line: 108, column: 22, scope: !149)
!156 = !DILocation(line: 108, column: 9, scope: !149)
!157 = !DILocation(line: 109, column: 19, scope: !149)
!158 = !DILocation(line: 109, column: 9, scope: !149)
!159 = !DILocation(line: 113, column: 1, scope: !122)
