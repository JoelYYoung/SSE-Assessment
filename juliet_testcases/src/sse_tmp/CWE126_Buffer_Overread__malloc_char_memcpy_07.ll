; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %cmp1 = icmp eq i8* %1, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !55
  %mul = mul i64 %call7, 1, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 %mul, i1 false), !dbg !52
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx8, align 1, !dbg !58
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @printLine(i8* %arraydecay9), !dbg !60
  %5 = load i8*, i8** %data, align 8, !dbg !61
  call void @free(i8* %5) #8, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_07_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #8, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #8, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_07_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_07_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %0 = load i32, i32* @staticFive, align 4, !dbg !90
  %cmp = icmp ne i32 %0, 5, !dbg !92
  br i1 %cmp, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !99
  %1 = load i8*, i8** %data, align 8, !dbg !100
  %cmp1 = icmp eq i8* %1, null, !dbg !102
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !103

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !113
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx4, align 1, !dbg !115
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !119
  %mul = mul i64 %call7, 1, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 %mul, i1 false), !dbg !116
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx8, align 1, !dbg !122
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay9), !dbg !124
  %5 = load i8*, i8** %data, align 8, !dbg !125
  call void @free(i8* %5) #8, !dbg !126
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !129, metadata !DIExpression()), !dbg !130
  store i8* null, i8** %data, align 8, !dbg !131
  %0 = load i32, i32* @staticFive, align 4, !dbg !132
  %cmp = icmp eq i32 %0, 5, !dbg !134
  br i1 %cmp, label %if.then, label %if.end3, !dbg !135

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !136
  store i8* %call, i8** %data, align 8, !dbg !138
  %1 = load i8*, i8** %data, align 8, !dbg !139
  %cmp1 = icmp eq i8* %1, null, !dbg !141
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !142

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !146
  %3 = load i8*, i8** %data, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !148
  br label %if.end3, !dbg !149

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !150, metadata !DIExpression()), !dbg !152
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !153
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !154
  store i8 0, i8* %arrayidx4, align 1, !dbg !155
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !156
  %4 = load i8*, i8** %data, align 8, !dbg !157
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !158
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !159
  %mul = mul i64 %call7, 1, !dbg !160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 %mul, i1 false), !dbg !156
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !161
  store i8 0, i8* %arrayidx8, align 1, !dbg !162
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !163
  call void @printLine(i8* %arraydecay9), !dbg !164
  %5 = load i8*, i8** %data, align 8, !dbg !165
  call void @free(i8* %5) #8, !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_07.c", directory: "/root/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 10, scope: !19)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 18, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !19)
!29 = !DILocation(line: 36, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 34, column: 5)
!31 = !DILocation(line: 36, column: 14, scope: !30)
!32 = !DILocation(line: 37, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 13)
!34 = !DILocation(line: 37, column: 18, scope: !33)
!35 = !DILocation(line: 37, column: 13, scope: !30)
!36 = !DILocation(line: 37, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 37, column: 27)
!38 = !DILocation(line: 38, column: 16, scope: !30)
!39 = !DILocation(line: 38, column: 9, scope: !30)
!40 = !DILocation(line: 39, column: 9, scope: !30)
!41 = !DILocation(line: 39, column: 20, scope: !30)
!42 = !DILocation(line: 40, column: 5, scope: !30)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !11, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !19, file: !11, line: 41, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 42, column: 14, scope: !44)
!49 = !DILocation(line: 43, column: 9, scope: !44)
!50 = !DILocation(line: 44, column: 9, scope: !44)
!51 = !DILocation(line: 44, column: 21, scope: !44)
!52 = !DILocation(line: 47, column: 9, scope: !44)
!53 = !DILocation(line: 47, column: 22, scope: !44)
!54 = !DILocation(line: 47, column: 35, scope: !44)
!55 = !DILocation(line: 47, column: 28, scope: !44)
!56 = !DILocation(line: 47, column: 40, scope: !44)
!57 = !DILocation(line: 48, column: 9, scope: !44)
!58 = !DILocation(line: 48, column: 21, scope: !44)
!59 = !DILocation(line: 49, column: 19, scope: !44)
!60 = !DILocation(line: 49, column: 9, scope: !44)
!61 = !DILocation(line: 50, column: 14, scope: !44)
!62 = !DILocation(line: 50, column: 9, scope: !44)
!63 = !DILocation(line: 52, column: 1, scope: !19)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_07_good", scope: !11, file: !11, line: 115, type: !20, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 117, column: 5, scope: !64)
!66 = !DILocation(line: 118, column: 5, scope: !64)
!67 = !DILocation(line: 119, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 131, type: !69, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!12, !12, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !11, line: 131, type: !12)
!73 = !DILocation(line: 131, column: 14, scope: !68)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !11, line: 131, type: !71)
!75 = !DILocation(line: 131, column: 27, scope: !68)
!76 = !DILocation(line: 134, column: 22, scope: !68)
!77 = !DILocation(line: 134, column: 12, scope: !68)
!78 = !DILocation(line: 134, column: 5, scope: !68)
!79 = !DILocation(line: 136, column: 5, scope: !68)
!80 = !DILocation(line: 137, column: 5, scope: !68)
!81 = !DILocation(line: 138, column: 5, scope: !68)
!82 = !DILocation(line: 141, column: 5, scope: !68)
!83 = !DILocation(line: 142, column: 5, scope: !68)
!84 = !DILocation(line: 143, column: 5, scope: !68)
!85 = !DILocation(line: 145, column: 5, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !11, line: 61, type: !6)
!88 = !DILocation(line: 61, column: 12, scope: !86)
!89 = !DILocation(line: 62, column: 10, scope: !86)
!90 = !DILocation(line: 63, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !11, line: 63, column: 8)
!92 = !DILocation(line: 63, column: 18, scope: !91)
!93 = !DILocation(line: 63, column: 8, scope: !86)
!94 = !DILocation(line: 66, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !11, line: 64, column: 5)
!96 = !DILocation(line: 67, column: 5, scope: !95)
!97 = !DILocation(line: 71, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !11, line: 69, column: 5)
!99 = !DILocation(line: 71, column: 14, scope: !98)
!100 = !DILocation(line: 72, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !11, line: 72, column: 13)
!102 = !DILocation(line: 72, column: 18, scope: !101)
!103 = !DILocation(line: 72, column: 13, scope: !98)
!104 = !DILocation(line: 72, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !11, line: 72, column: 27)
!106 = !DILocation(line: 73, column: 16, scope: !98)
!107 = !DILocation(line: 73, column: 9, scope: !98)
!108 = !DILocation(line: 74, column: 9, scope: !98)
!109 = !DILocation(line: 74, column: 21, scope: !98)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !11, line: 77, type: !45)
!111 = distinct !DILexicalBlock(scope: !86, file: !11, line: 76, column: 5)
!112 = !DILocation(line: 77, column: 14, scope: !111)
!113 = !DILocation(line: 78, column: 9, scope: !111)
!114 = !DILocation(line: 79, column: 9, scope: !111)
!115 = !DILocation(line: 79, column: 21, scope: !111)
!116 = !DILocation(line: 82, column: 9, scope: !111)
!117 = !DILocation(line: 82, column: 22, scope: !111)
!118 = !DILocation(line: 82, column: 35, scope: !111)
!119 = !DILocation(line: 82, column: 28, scope: !111)
!120 = !DILocation(line: 82, column: 40, scope: !111)
!121 = !DILocation(line: 83, column: 9, scope: !111)
!122 = !DILocation(line: 83, column: 21, scope: !111)
!123 = !DILocation(line: 84, column: 19, scope: !111)
!124 = !DILocation(line: 84, column: 9, scope: !111)
!125 = !DILocation(line: 85, column: 14, scope: !111)
!126 = !DILocation(line: 85, column: 9, scope: !111)
!127 = !DILocation(line: 87, column: 1, scope: !86)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DILocalVariable(name: "data", scope: !128, file: !11, line: 92, type: !6)
!130 = !DILocation(line: 92, column: 12, scope: !128)
!131 = !DILocation(line: 93, column: 10, scope: !128)
!132 = !DILocation(line: 94, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !11, line: 94, column: 8)
!134 = !DILocation(line: 94, column: 18, scope: !133)
!135 = !DILocation(line: 94, column: 8, scope: !128)
!136 = !DILocation(line: 97, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !11, line: 95, column: 5)
!138 = !DILocation(line: 97, column: 14, scope: !137)
!139 = !DILocation(line: 98, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !11, line: 98, column: 13)
!141 = !DILocation(line: 98, column: 18, scope: !140)
!142 = !DILocation(line: 98, column: 13, scope: !137)
!143 = !DILocation(line: 98, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !11, line: 98, column: 27)
!145 = !DILocation(line: 99, column: 16, scope: !137)
!146 = !DILocation(line: 99, column: 9, scope: !137)
!147 = !DILocation(line: 100, column: 9, scope: !137)
!148 = !DILocation(line: 100, column: 21, scope: !137)
!149 = !DILocation(line: 101, column: 5, scope: !137)
!150 = !DILocalVariable(name: "dest", scope: !151, file: !11, line: 103, type: !45)
!151 = distinct !DILexicalBlock(scope: !128, file: !11, line: 102, column: 5)
!152 = !DILocation(line: 103, column: 14, scope: !151)
!153 = !DILocation(line: 104, column: 9, scope: !151)
!154 = !DILocation(line: 105, column: 9, scope: !151)
!155 = !DILocation(line: 105, column: 21, scope: !151)
!156 = !DILocation(line: 108, column: 9, scope: !151)
!157 = !DILocation(line: 108, column: 22, scope: !151)
!158 = !DILocation(line: 108, column: 35, scope: !151)
!159 = !DILocation(line: 108, column: 28, scope: !151)
!160 = !DILocation(line: 108, column: 40, scope: !151)
!161 = !DILocation(line: 109, column: 9, scope: !151)
!162 = !DILocation(line: 109, column: 21, scope: !151)
!163 = !DILocation(line: 110, column: 19, scope: !151)
!164 = !DILocation(line: 110, column: 9, scope: !151)
!165 = !DILocation(line: 111, column: 14, scope: !151)
!166 = !DILocation(line: 111, column: 9, scope: !151)
!167 = !DILocation(line: 113, column: 1, scope: !128)
