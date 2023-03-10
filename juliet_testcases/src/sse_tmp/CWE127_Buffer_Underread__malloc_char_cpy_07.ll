; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !33
  store i8* %call, i8** %dataBuffer, align 8, !dbg !32
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !41
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !44
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !45
  store i8* %add.ptr, i8** %data, align 8, !dbg !46
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !54
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !55
  store i8 0, i8* %arrayidx4, align 1, !dbg !56
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !57
  %5 = load i8*, i8** %data, align 8, !dbg !58
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %5) #6, !dbg !59
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay7), !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_07_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__malloc_char_cpy_07_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__malloc_char_cpy_07_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %0 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp = icmp ne i32 %0, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end3, !dbg !95

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !100
  store i8* %call, i8** %dataBuffer, align 8, !dbg !99
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  %cmp1 = icmp eq i8* %1, null, !dbg !103
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !104

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !108
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  store i8* %4, i8** %data, align 8, !dbg !112
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !116
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !117
  store i8 0, i8* %arrayidx4, align 1, !dbg !118
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !119
  %5 = load i8*, i8** %data, align 8, !dbg !120
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %5) #6, !dbg !121
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !122
  call void @printLine(i8* %arraydecay7), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i8* null, i8** %data, align 8, !dbg !128
  %0 = load i32, i32* @staticFive, align 4, !dbg !129
  %cmp = icmp eq i32 %0, 5, !dbg !131
  br i1 %cmp, label %if.then, label %if.end3, !dbg !132

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !133, metadata !DIExpression()), !dbg !136
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !137
  store i8* %call, i8** %dataBuffer, align 8, !dbg !136
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !138
  %cmp1 = icmp eq i8* %1, null, !dbg !140
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !141

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !145
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !148
  store i8* %4, i8** %data, align 8, !dbg !149
  br label %if.end3, !dbg !150

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !151, metadata !DIExpression()), !dbg !153
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !154
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !155
  store i8 0, i8* %arrayidx4, align 1, !dbg !156
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !157
  %5 = load i8*, i8** %data, align 8, !dbg !158
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %5) #6, !dbg !159
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !160
  call void @printLine(i8* %arraydecay7), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 10, scope: !19)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 18, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !19)
!29 = !DILocalVariable(name: "dataBuffer", scope: !30, file: !11, line: 36, type: !6)
!30 = distinct !DILexicalBlock(scope: !31, file: !11, line: 35, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !11, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 20, scope: !30)
!33 = !DILocation(line: 36, column: 41, scope: !30)
!34 = !DILocation(line: 37, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 17)
!36 = !DILocation(line: 37, column: 28, scope: !35)
!37 = !DILocation(line: 37, column: 17, scope: !30)
!38 = !DILocation(line: 37, column: 38, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !11, line: 37, column: 37)
!40 = !DILocation(line: 38, column: 20, scope: !30)
!41 = !DILocation(line: 38, column: 13, scope: !30)
!42 = !DILocation(line: 39, column: 13, scope: !30)
!43 = !DILocation(line: 39, column: 31, scope: !30)
!44 = !DILocation(line: 41, column: 20, scope: !30)
!45 = !DILocation(line: 41, column: 31, scope: !30)
!46 = !DILocation(line: 41, column: 18, scope: !30)
!47 = !DILocation(line: 43, column: 5, scope: !31)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !11, line: 45, type: !50)
!49 = distinct !DILexicalBlock(scope: !19, file: !11, line: 44, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 200)
!53 = !DILocation(line: 45, column: 14, scope: !49)
!54 = !DILocation(line: 46, column: 9, scope: !49)
!55 = !DILocation(line: 47, column: 9, scope: !49)
!56 = !DILocation(line: 47, column: 23, scope: !49)
!57 = !DILocation(line: 49, column: 16, scope: !49)
!58 = !DILocation(line: 49, column: 22, scope: !49)
!59 = !DILocation(line: 49, column: 9, scope: !49)
!60 = !DILocation(line: 50, column: 19, scope: !49)
!61 = !DILocation(line: 50, column: 9, scope: !49)
!62 = !DILocation(line: 54, column: 1, scope: !19)
!63 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_07_good", scope: !11, file: !11, line: 121, type: !20, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 123, column: 5, scope: !63)
!65 = !DILocation(line: 124, column: 5, scope: !63)
!66 = !DILocation(line: 125, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 137, type: !68, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!12, !12, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !11, line: 137, type: !12)
!72 = !DILocation(line: 137, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !11, line: 137, type: !70)
!74 = !DILocation(line: 137, column: 27, scope: !67)
!75 = !DILocation(line: 140, column: 22, scope: !67)
!76 = !DILocation(line: 140, column: 12, scope: !67)
!77 = !DILocation(line: 140, column: 5, scope: !67)
!78 = !DILocation(line: 142, column: 5, scope: !67)
!79 = !DILocation(line: 143, column: 5, scope: !67)
!80 = !DILocation(line: 144, column: 5, scope: !67)
!81 = !DILocation(line: 147, column: 5, scope: !67)
!82 = !DILocation(line: 148, column: 5, scope: !67)
!83 = !DILocation(line: 149, column: 5, scope: !67)
!84 = !DILocation(line: 151, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !11, line: 63, type: !6)
!87 = !DILocation(line: 63, column: 12, scope: !85)
!88 = !DILocation(line: 64, column: 10, scope: !85)
!89 = !DILocation(line: 65, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !11, line: 65, column: 8)
!91 = !DILocation(line: 65, column: 18, scope: !90)
!92 = !DILocation(line: 65, column: 8, scope: !85)
!93 = !DILocation(line: 68, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !11, line: 66, column: 5)
!95 = !DILocation(line: 69, column: 5, scope: !94)
!96 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !11, line: 73, type: !6)
!97 = distinct !DILexicalBlock(scope: !98, file: !11, line: 72, column: 9)
!98 = distinct !DILexicalBlock(scope: !90, file: !11, line: 71, column: 5)
!99 = !DILocation(line: 73, column: 20, scope: !97)
!100 = !DILocation(line: 73, column: 41, scope: !97)
!101 = !DILocation(line: 74, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !11, line: 74, column: 17)
!103 = !DILocation(line: 74, column: 28, scope: !102)
!104 = !DILocation(line: 74, column: 17, scope: !97)
!105 = !DILocation(line: 74, column: 38, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !11, line: 74, column: 37)
!107 = !DILocation(line: 75, column: 20, scope: !97)
!108 = !DILocation(line: 75, column: 13, scope: !97)
!109 = !DILocation(line: 76, column: 13, scope: !97)
!110 = !DILocation(line: 76, column: 31, scope: !97)
!111 = !DILocation(line: 78, column: 20, scope: !97)
!112 = !DILocation(line: 78, column: 18, scope: !97)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !11, line: 82, type: !50)
!114 = distinct !DILexicalBlock(scope: !85, file: !11, line: 81, column: 5)
!115 = !DILocation(line: 82, column: 14, scope: !114)
!116 = !DILocation(line: 83, column: 9, scope: !114)
!117 = !DILocation(line: 84, column: 9, scope: !114)
!118 = !DILocation(line: 84, column: 23, scope: !114)
!119 = !DILocation(line: 86, column: 16, scope: !114)
!120 = !DILocation(line: 86, column: 22, scope: !114)
!121 = !DILocation(line: 86, column: 9, scope: !114)
!122 = !DILocation(line: 87, column: 19, scope: !114)
!123 = !DILocation(line: 87, column: 9, scope: !114)
!124 = !DILocation(line: 91, column: 1, scope: !85)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 94, type: !20, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !11, line: 96, type: !6)
!127 = !DILocation(line: 96, column: 12, scope: !125)
!128 = !DILocation(line: 97, column: 10, scope: !125)
!129 = !DILocation(line: 98, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !11, line: 98, column: 8)
!131 = !DILocation(line: 98, column: 18, scope: !130)
!132 = !DILocation(line: 98, column: 8, scope: !125)
!133 = !DILocalVariable(name: "dataBuffer", scope: !134, file: !11, line: 101, type: !6)
!134 = distinct !DILexicalBlock(scope: !135, file: !11, line: 100, column: 9)
!135 = distinct !DILexicalBlock(scope: !130, file: !11, line: 99, column: 5)
!136 = !DILocation(line: 101, column: 20, scope: !134)
!137 = !DILocation(line: 101, column: 41, scope: !134)
!138 = !DILocation(line: 102, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !11, line: 102, column: 17)
!140 = !DILocation(line: 102, column: 28, scope: !139)
!141 = !DILocation(line: 102, column: 17, scope: !134)
!142 = !DILocation(line: 102, column: 38, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !11, line: 102, column: 37)
!144 = !DILocation(line: 103, column: 20, scope: !134)
!145 = !DILocation(line: 103, column: 13, scope: !134)
!146 = !DILocation(line: 104, column: 13, scope: !134)
!147 = !DILocation(line: 104, column: 31, scope: !134)
!148 = !DILocation(line: 106, column: 20, scope: !134)
!149 = !DILocation(line: 106, column: 18, scope: !134)
!150 = !DILocation(line: 108, column: 5, scope: !135)
!151 = !DILocalVariable(name: "dest", scope: !152, file: !11, line: 110, type: !50)
!152 = distinct !DILexicalBlock(scope: !125, file: !11, line: 109, column: 5)
!153 = !DILocation(line: 110, column: 14, scope: !152)
!154 = !DILocation(line: 111, column: 9, scope: !152)
!155 = !DILocation(line: 112, column: 9, scope: !152)
!156 = !DILocation(line: 112, column: 23, scope: !152)
!157 = !DILocation(line: 114, column: 16, scope: !152)
!158 = !DILocation(line: 114, column: 22, scope: !152)
!159 = !DILocation(line: 114, column: 9, scope: !152)
!160 = !DILocation(line: 115, column: 19, scope: !152)
!161 = !DILocation(line: 115, column: 9, scope: !152)
!162 = !DILocation(line: 119, column: 1, scope: !125)
