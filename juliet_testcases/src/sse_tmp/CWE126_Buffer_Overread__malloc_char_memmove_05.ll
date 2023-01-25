; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %cmp = icmp eq i8* %1, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end2, !dbg !43

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call6 = call i64 @strlen(i8* %arraydecay5) #10, !dbg !56
  %mul = mul i64 %call6, 1, !dbg !57
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %4, i64 %mul, i1 false), !dbg !53
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx7, align 1, !dbg !59
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay8), !dbg !61
  %5 = load i8*, i8** %data, align 8, !dbg !62
  call void @free(i8* %5) #8, !dbg !63
  ret void, !dbg !64
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
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_05_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #8, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #8, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__malloc_char_memmove_05_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__malloc_char_memmove_05_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  %0 = load i32, i32* @staticFalse, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end2, !dbg !96

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !99
  %1 = load i8*, i8** %data, align 8, !dbg !100
  %cmp = icmp eq i8* %1, null, !dbg !102
  br i1 %cmp, label %if.then1, label %if.end, !dbg !103

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !113
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx3, align 1, !dbg !115
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  %call6 = call i64 @strlen(i8* %arraydecay5) #10, !dbg !119
  %mul = mul i64 %call6, 1, !dbg !120
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %4, i64 %mul, i1 false), !dbg !116
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx7, align 1, !dbg !122
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay8), !dbg !124
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !132
  %tobool = icmp ne i32 %0, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.end2, !dbg !134

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !135
  store i8* %call, i8** %data, align 8, !dbg !137
  %1 = load i8*, i8** %data, align 8, !dbg !138
  %cmp = icmp eq i8* %1, null, !dbg !140
  br i1 %cmp, label %if.then1, label %if.end, !dbg !141

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !145
  %3 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  br label %if.end2, !dbg !148

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !149, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !152
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !153
  store i8 0, i8* %arrayidx3, align 1, !dbg !154
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !155
  %4 = load i8*, i8** %data, align 8, !dbg !156
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  %call6 = call i64 @strlen(i8* %arraydecay5) #10, !dbg !158
  %mul = mul i64 %call6, 1, !dbg !159
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %4, i64 %mul, i1 false), !dbg !155
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !160
  store i8 0, i8* %arrayidx7, align 1, !dbg !161
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !162
  call void @printLine(i8* %arraydecay8), !dbg !163
  %5 = load i8*, i8** %data, align 8, !dbg !164
  call void @free(i8* %5) #8, !dbg !165
  ret void, !dbg !166
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !21)
!30 = !DILocation(line: 37, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !13, line: 35, column: 5)
!32 = !DILocation(line: 37, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !13, line: 38, column: 13)
!35 = !DILocation(line: 38, column: 18, scope: !34)
!36 = !DILocation(line: 38, column: 13, scope: !31)
!37 = !DILocation(line: 38, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 38, column: 27)
!39 = !DILocation(line: 39, column: 16, scope: !31)
!40 = !DILocation(line: 39, column: 9, scope: !31)
!41 = !DILocation(line: 40, column: 9, scope: !31)
!42 = !DILocation(line: 40, column: 20, scope: !31)
!43 = !DILocation(line: 41, column: 5, scope: !31)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !13, line: 43, type: !46)
!45 = distinct !DILexicalBlock(scope: !21, file: !13, line: 42, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 43, column: 14, scope: !45)
!50 = !DILocation(line: 44, column: 9, scope: !45)
!51 = !DILocation(line: 45, column: 9, scope: !45)
!52 = !DILocation(line: 45, column: 21, scope: !45)
!53 = !DILocation(line: 48, column: 9, scope: !45)
!54 = !DILocation(line: 48, column: 23, scope: !45)
!55 = !DILocation(line: 48, column: 36, scope: !45)
!56 = !DILocation(line: 48, column: 29, scope: !45)
!57 = !DILocation(line: 48, column: 41, scope: !45)
!58 = !DILocation(line: 49, column: 9, scope: !45)
!59 = !DILocation(line: 49, column: 21, scope: !45)
!60 = !DILocation(line: 50, column: 19, scope: !45)
!61 = !DILocation(line: 50, column: 9, scope: !45)
!62 = !DILocation(line: 51, column: 14, scope: !45)
!63 = !DILocation(line: 51, column: 9, scope: !45)
!64 = !DILocation(line: 53, column: 1, scope: !21)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_05_good", scope: !13, file: !13, line: 116, type: !22, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 118, column: 5, scope: !65)
!67 = !DILocation(line: 119, column: 5, scope: !65)
!68 = !DILocation(line: 120, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 132, type: !70, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!14, !14, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !13, line: 132, type: !14)
!74 = !DILocation(line: 132, column: 14, scope: !69)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !13, line: 132, type: !72)
!76 = !DILocation(line: 132, column: 27, scope: !69)
!77 = !DILocation(line: 135, column: 22, scope: !69)
!78 = !DILocation(line: 135, column: 12, scope: !69)
!79 = !DILocation(line: 135, column: 5, scope: !69)
!80 = !DILocation(line: 137, column: 5, scope: !69)
!81 = !DILocation(line: 138, column: 5, scope: !69)
!82 = !DILocation(line: 139, column: 5, scope: !69)
!83 = !DILocation(line: 142, column: 5, scope: !69)
!84 = !DILocation(line: 143, column: 5, scope: !69)
!85 = !DILocation(line: 144, column: 5, scope: !69)
!86 = !DILocation(line: 146, column: 5, scope: !69)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !13, line: 62, type: !6)
!89 = !DILocation(line: 62, column: 12, scope: !87)
!90 = !DILocation(line: 63, column: 10, scope: !87)
!91 = !DILocation(line: 64, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !13, line: 64, column: 8)
!93 = !DILocation(line: 64, column: 8, scope: !87)
!94 = !DILocation(line: 67, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !13, line: 65, column: 5)
!96 = !DILocation(line: 68, column: 5, scope: !95)
!97 = !DILocation(line: 72, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !13, line: 70, column: 5)
!99 = !DILocation(line: 72, column: 14, scope: !98)
!100 = !DILocation(line: 73, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !13, line: 73, column: 13)
!102 = !DILocation(line: 73, column: 18, scope: !101)
!103 = !DILocation(line: 73, column: 13, scope: !98)
!104 = !DILocation(line: 73, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !13, line: 73, column: 27)
!106 = !DILocation(line: 74, column: 16, scope: !98)
!107 = !DILocation(line: 74, column: 9, scope: !98)
!108 = !DILocation(line: 75, column: 9, scope: !98)
!109 = !DILocation(line: 75, column: 21, scope: !98)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !13, line: 78, type: !46)
!111 = distinct !DILexicalBlock(scope: !87, file: !13, line: 77, column: 5)
!112 = !DILocation(line: 78, column: 14, scope: !111)
!113 = !DILocation(line: 79, column: 9, scope: !111)
!114 = !DILocation(line: 80, column: 9, scope: !111)
!115 = !DILocation(line: 80, column: 21, scope: !111)
!116 = !DILocation(line: 83, column: 9, scope: !111)
!117 = !DILocation(line: 83, column: 23, scope: !111)
!118 = !DILocation(line: 83, column: 36, scope: !111)
!119 = !DILocation(line: 83, column: 29, scope: !111)
!120 = !DILocation(line: 83, column: 41, scope: !111)
!121 = !DILocation(line: 84, column: 9, scope: !111)
!122 = !DILocation(line: 84, column: 21, scope: !111)
!123 = !DILocation(line: 85, column: 19, scope: !111)
!124 = !DILocation(line: 85, column: 9, scope: !111)
!125 = !DILocation(line: 86, column: 14, scope: !111)
!126 = !DILocation(line: 86, column: 9, scope: !111)
!127 = !DILocation(line: 88, column: 1, scope: !87)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 91, type: !22, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DILocalVariable(name: "data", scope: !128, file: !13, line: 93, type: !6)
!130 = !DILocation(line: 93, column: 12, scope: !128)
!131 = !DILocation(line: 94, column: 10, scope: !128)
!132 = !DILocation(line: 95, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !13, line: 95, column: 8)
!134 = !DILocation(line: 95, column: 8, scope: !128)
!135 = !DILocation(line: 98, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !13, line: 96, column: 5)
!137 = !DILocation(line: 98, column: 14, scope: !136)
!138 = !DILocation(line: 99, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !13, line: 99, column: 13)
!140 = !DILocation(line: 99, column: 18, scope: !139)
!141 = !DILocation(line: 99, column: 13, scope: !136)
!142 = !DILocation(line: 99, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !13, line: 99, column: 27)
!144 = !DILocation(line: 100, column: 16, scope: !136)
!145 = !DILocation(line: 100, column: 9, scope: !136)
!146 = !DILocation(line: 101, column: 9, scope: !136)
!147 = !DILocation(line: 101, column: 21, scope: !136)
!148 = !DILocation(line: 102, column: 5, scope: !136)
!149 = !DILocalVariable(name: "dest", scope: !150, file: !13, line: 104, type: !46)
!150 = distinct !DILexicalBlock(scope: !128, file: !13, line: 103, column: 5)
!151 = !DILocation(line: 104, column: 14, scope: !150)
!152 = !DILocation(line: 105, column: 9, scope: !150)
!153 = !DILocation(line: 106, column: 9, scope: !150)
!154 = !DILocation(line: 106, column: 21, scope: !150)
!155 = !DILocation(line: 109, column: 9, scope: !150)
!156 = !DILocation(line: 109, column: 23, scope: !150)
!157 = !DILocation(line: 109, column: 36, scope: !150)
!158 = !DILocation(line: 109, column: 29, scope: !150)
!159 = !DILocation(line: 109, column: 41, scope: !150)
!160 = !DILocation(line: 110, column: 9, scope: !150)
!161 = !DILocation(line: 110, column: 21, scope: !150)
!162 = !DILocation(line: 111, column: 19, scope: !150)
!163 = !DILocation(line: 111, column: 9, scope: !150)
!164 = !DILocation(line: 112, column: 14, scope: !150)
!165 = !DILocation(line: 112, column: 9, scope: !150)
!166 = !DILocation(line: 114, column: 1, scope: !128)
