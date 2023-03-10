; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_13.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx4, align 1, !dbg !52
  %5 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  %call6 = call i8* @strncpy(i8* %5, i8* %arraydecay5, i64 99) #6, !dbg !55
  %6 = load i8*, i8** %data, align 8, !dbg !56
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !56
  store i8 0, i8* %arrayidx7, align 1, !dbg !57
  %7 = load i8*, i8** %data, align 8, !dbg !58
  call void @printLine(i8* %7), !dbg !59
  ret void, !dbg !60
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_13_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_13_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_13_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i8* null, i8** %data, align 8, !dbg !87
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !88
  %cmp = icmp ne i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end3, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !99
  store i8* %call, i8** %dataBuffer, align 8, !dbg !98
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  %cmp1 = icmp eq i8* %1, null, !dbg !102
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !103

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !107
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  store i8* %4, i8** %data, align 8, !dbg !111
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx4, align 1, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  %call6 = call i8* @strncpy(i8* %5, i8* %arraydecay5, i64 99) #6, !dbg !120
  %6 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !121
  store i8 0, i8* %arrayidx7, align 1, !dbg !122
  %7 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* %7), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !126 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i8* null, i8** %data, align 8, !dbg !129
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !130
  %cmp = icmp eq i32 %0, 5, !dbg !132
  br i1 %cmp, label %if.then, label %if.end3, !dbg !133

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !134, metadata !DIExpression()), !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !138
  store i8* %call, i8** %dataBuffer, align 8, !dbg !137
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !139
  %cmp1 = icmp eq i8* %1, null, !dbg !141
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !142

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !146
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !148
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !149
  store i8* %4, i8** %data, align 8, !dbg !150
  br label %if.end3, !dbg !151

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !152, metadata !DIExpression()), !dbg !154
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !155
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !156
  store i8 0, i8* %arrayidx4, align 1, !dbg !157
  %5 = load i8*, i8** %data, align 8, !dbg !158
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !159
  %call6 = call i8* @strncpy(i8* %5, i8* %arraydecay5, i64 99) #6, !dbg !160
  %6 = load i8*, i8** %data, align 8, !dbg !161
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !161
  store i8 0, i8* %arrayidx7, align 1, !dbg !162
  %7 = load i8*, i8** %data, align 8, !dbg !163
  call void @printLine(i8* %7), !dbg !164
  ret void, !dbg !165
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_13_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 25, scope: !22)
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
!44 = !DILocalVariable(name: "source", scope: !45, file: !15, line: 39, type: !46)
!45 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 39, column: 14, scope: !45)
!50 = !DILocation(line: 40, column: 9, scope: !45)
!51 = !DILocation(line: 41, column: 9, scope: !45)
!52 = !DILocation(line: 41, column: 23, scope: !45)
!53 = !DILocation(line: 43, column: 17, scope: !45)
!54 = !DILocation(line: 43, column: 23, scope: !45)
!55 = !DILocation(line: 43, column: 9, scope: !45)
!56 = !DILocation(line: 45, column: 9, scope: !45)
!57 = !DILocation(line: 45, column: 21, scope: !45)
!58 = !DILocation(line: 46, column: 19, scope: !45)
!59 = !DILocation(line: 46, column: 9, scope: !45)
!60 = !DILocation(line: 50, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_13_good", scope: !15, file: !15, line: 121, type: !16, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 123, column: 5, scope: !61)
!63 = !DILocation(line: 124, column: 5, scope: !61)
!64 = !DILocation(line: 125, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 137, type: !66, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !15, line: 137, type: !68)
!71 = !DILocation(line: 137, column: 14, scope: !65)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !15, line: 137, type: !69)
!73 = !DILocation(line: 137, column: 27, scope: !65)
!74 = !DILocation(line: 140, column: 22, scope: !65)
!75 = !DILocation(line: 140, column: 12, scope: !65)
!76 = !DILocation(line: 140, column: 5, scope: !65)
!77 = !DILocation(line: 142, column: 5, scope: !65)
!78 = !DILocation(line: 143, column: 5, scope: !65)
!79 = !DILocation(line: 144, column: 5, scope: !65)
!80 = !DILocation(line: 147, column: 5, scope: !65)
!81 = !DILocation(line: 148, column: 5, scope: !65)
!82 = !DILocation(line: 149, column: 5, scope: !65)
!83 = !DILocation(line: 151, column: 5, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 59, type: !4)
!86 = !DILocation(line: 59, column: 12, scope: !84)
!87 = !DILocation(line: 60, column: 10, scope: !84)
!88 = !DILocation(line: 61, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !15, line: 61, column: 8)
!90 = !DILocation(line: 61, column: 25, scope: !89)
!91 = !DILocation(line: 61, column: 8, scope: !84)
!92 = !DILocation(line: 64, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 62, column: 5)
!94 = !DILocation(line: 65, column: 5, scope: !93)
!95 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !15, line: 69, type: !4)
!96 = distinct !DILexicalBlock(scope: !97, file: !15, line: 68, column: 9)
!97 = distinct !DILexicalBlock(scope: !89, file: !15, line: 67, column: 5)
!98 = !DILocation(line: 69, column: 20, scope: !96)
!99 = !DILocation(line: 69, column: 41, scope: !96)
!100 = !DILocation(line: 70, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !15, line: 70, column: 17)
!102 = !DILocation(line: 70, column: 28, scope: !101)
!103 = !DILocation(line: 70, column: 17, scope: !96)
!104 = !DILocation(line: 70, column: 38, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 70, column: 37)
!106 = !DILocation(line: 71, column: 20, scope: !96)
!107 = !DILocation(line: 71, column: 13, scope: !96)
!108 = !DILocation(line: 72, column: 13, scope: !96)
!109 = !DILocation(line: 72, column: 31, scope: !96)
!110 = !DILocation(line: 74, column: 20, scope: !96)
!111 = !DILocation(line: 74, column: 18, scope: !96)
!112 = !DILocalVariable(name: "source", scope: !113, file: !15, line: 78, type: !46)
!113 = distinct !DILexicalBlock(scope: !84, file: !15, line: 77, column: 5)
!114 = !DILocation(line: 78, column: 14, scope: !113)
!115 = !DILocation(line: 79, column: 9, scope: !113)
!116 = !DILocation(line: 80, column: 9, scope: !113)
!117 = !DILocation(line: 80, column: 23, scope: !113)
!118 = !DILocation(line: 82, column: 17, scope: !113)
!119 = !DILocation(line: 82, column: 23, scope: !113)
!120 = !DILocation(line: 82, column: 9, scope: !113)
!121 = !DILocation(line: 84, column: 9, scope: !113)
!122 = !DILocation(line: 84, column: 21, scope: !113)
!123 = !DILocation(line: 85, column: 19, scope: !113)
!124 = !DILocation(line: 85, column: 9, scope: !113)
!125 = !DILocation(line: 89, column: 1, scope: !84)
!126 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !15, line: 94, type: !4)
!128 = !DILocation(line: 94, column: 12, scope: !126)
!129 = !DILocation(line: 95, column: 10, scope: !126)
!130 = !DILocation(line: 96, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !15, line: 96, column: 8)
!132 = !DILocation(line: 96, column: 25, scope: !131)
!133 = !DILocation(line: 96, column: 8, scope: !126)
!134 = !DILocalVariable(name: "dataBuffer", scope: !135, file: !15, line: 99, type: !4)
!135 = distinct !DILexicalBlock(scope: !136, file: !15, line: 98, column: 9)
!136 = distinct !DILexicalBlock(scope: !131, file: !15, line: 97, column: 5)
!137 = !DILocation(line: 99, column: 20, scope: !135)
!138 = !DILocation(line: 99, column: 41, scope: !135)
!139 = !DILocation(line: 100, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !15, line: 100, column: 17)
!141 = !DILocation(line: 100, column: 28, scope: !140)
!142 = !DILocation(line: 100, column: 17, scope: !135)
!143 = !DILocation(line: 100, column: 38, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 100, column: 37)
!145 = !DILocation(line: 101, column: 20, scope: !135)
!146 = !DILocation(line: 101, column: 13, scope: !135)
!147 = !DILocation(line: 102, column: 13, scope: !135)
!148 = !DILocation(line: 102, column: 31, scope: !135)
!149 = !DILocation(line: 104, column: 20, scope: !135)
!150 = !DILocation(line: 104, column: 18, scope: !135)
!151 = !DILocation(line: 106, column: 5, scope: !136)
!152 = !DILocalVariable(name: "source", scope: !153, file: !15, line: 108, type: !46)
!153 = distinct !DILexicalBlock(scope: !126, file: !15, line: 107, column: 5)
!154 = !DILocation(line: 108, column: 14, scope: !153)
!155 = !DILocation(line: 109, column: 9, scope: !153)
!156 = !DILocation(line: 110, column: 9, scope: !153)
!157 = !DILocation(line: 110, column: 23, scope: !153)
!158 = !DILocation(line: 112, column: 17, scope: !153)
!159 = !DILocation(line: 112, column: 23, scope: !153)
!160 = !DILocation(line: 112, column: 9, scope: !153)
!161 = !DILocation(line: 114, column: 9, scope: !153)
!162 = !DILocation(line: 114, column: 21, scope: !153)
!163 = !DILocation(line: 115, column: 19, scope: !153)
!164 = !DILocation(line: 115, column: 9, scope: !153)
!165 = !DILocation(line: 119, column: 1, scope: !126)
