; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_05.c"
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !34
  store i8* %call, i8** %dataBuffer, align 8, !dbg !33
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i8* %1, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !42
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !45
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !46
  store i8* %add.ptr, i8** %data, align 8, !dbg !47
  br label %if.end2, !dbg !48

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  %5 = load i8*, i8** %data, align 8, !dbg !58
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !60
  store i8 0, i8* %arrayidx5, align 1, !dbg !61
  %7 = load i8*, i8** %data, align 8, !dbg !62
  call void @printLine(i8* %7), !dbg !63
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_05_good() #0 !dbg !65 {
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
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_05_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_05_bad(), !dbg !84
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
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  %0 = load i32, i32* @staticFalse, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end2, !dbg !96

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !101
  store i8* %call, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  %cmp = icmp eq i8* %1, null, !dbg !104
  br i1 %cmp, label %if.then1, label %if.end, !dbg !105

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !109
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  store i8* %4, i8** %data, align 8, !dbg !113
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx3, align 1, !dbg !119
  %5 = load i8*, i8** %data, align 8, !dbg !120
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !121
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !122
  store i8 0, i8* %arrayidx5, align 1, !dbg !123
  %7 = load i8*, i8** %data, align 8, !dbg !124
  call void @printLine(i8* %7), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !128, metadata !DIExpression()), !dbg !129
  store i8* null, i8** %data, align 8, !dbg !130
  %0 = load i32, i32* @staticTrue, align 4, !dbg !131
  %tobool = icmp ne i32 %0, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.end2, !dbg !133

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !134, metadata !DIExpression()), !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !138
  store i8* %call, i8** %dataBuffer, align 8, !dbg !137
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !139
  %cmp = icmp eq i8* %1, null, !dbg !141
  br i1 %cmp, label %if.then1, label %if.end, !dbg !142

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !146
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !148
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !149
  store i8* %4, i8** %data, align 8, !dbg !150
  br label %if.end2, !dbg !151

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !152, metadata !DIExpression()), !dbg !154
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !155
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !156
  store i8 0, i8* %arrayidx3, align 1, !dbg !157
  %5 = load i8*, i8** %data, align 8, !dbg !158
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !159
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !159
  %6 = load i8*, i8** %data, align 8, !dbg !160
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !160
  store i8 0, i8* %arrayidx5, align 1, !dbg !161
  %7 = load i8*, i8** %data, align 8, !dbg !162
  call void @printLine(i8* %7), !dbg !163
  ret void, !dbg !164
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !21)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !13, line: 37, type: !6)
!31 = distinct !DILexicalBlock(scope: !32, file: !13, line: 36, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !13, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 20, scope: !31)
!34 = !DILocation(line: 37, column: 41, scope: !31)
!35 = !DILocation(line: 38, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !13, line: 38, column: 17)
!37 = !DILocation(line: 38, column: 28, scope: !36)
!38 = !DILocation(line: 38, column: 17, scope: !31)
!39 = !DILocation(line: 38, column: 38, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !13, line: 38, column: 37)
!41 = !DILocation(line: 39, column: 20, scope: !31)
!42 = !DILocation(line: 39, column: 13, scope: !31)
!43 = !DILocation(line: 40, column: 13, scope: !31)
!44 = !DILocation(line: 40, column: 31, scope: !31)
!45 = !DILocation(line: 42, column: 20, scope: !31)
!46 = !DILocation(line: 42, column: 31, scope: !31)
!47 = !DILocation(line: 42, column: 18, scope: !31)
!48 = !DILocation(line: 44, column: 5, scope: !32)
!49 = !DILocalVariable(name: "source", scope: !50, file: !13, line: 46, type: !51)
!50 = distinct !DILexicalBlock(scope: !21, file: !13, line: 45, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 46, column: 14, scope: !50)
!55 = !DILocation(line: 47, column: 9, scope: !50)
!56 = !DILocation(line: 48, column: 9, scope: !50)
!57 = !DILocation(line: 48, column: 23, scope: !50)
!58 = !DILocation(line: 50, column: 17, scope: !50)
!59 = !DILocation(line: 50, column: 9, scope: !50)
!60 = !DILocation(line: 52, column: 9, scope: !50)
!61 = !DILocation(line: 52, column: 21, scope: !50)
!62 = !DILocation(line: 53, column: 19, scope: !50)
!63 = !DILocation(line: 53, column: 9, scope: !50)
!64 = !DILocation(line: 57, column: 1, scope: !21)
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_05_good", scope: !13, file: !13, line: 128, type: !22, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 130, column: 5, scope: !65)
!67 = !DILocation(line: 131, column: 5, scope: !65)
!68 = !DILocation(line: 132, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 144, type: !70, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!14, !14, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !13, line: 144, type: !14)
!74 = !DILocation(line: 144, column: 14, scope: !69)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !13, line: 144, type: !72)
!76 = !DILocation(line: 144, column: 27, scope: !69)
!77 = !DILocation(line: 147, column: 22, scope: !69)
!78 = !DILocation(line: 147, column: 12, scope: !69)
!79 = !DILocation(line: 147, column: 5, scope: !69)
!80 = !DILocation(line: 149, column: 5, scope: !69)
!81 = !DILocation(line: 150, column: 5, scope: !69)
!82 = !DILocation(line: 151, column: 5, scope: !69)
!83 = !DILocation(line: 154, column: 5, scope: !69)
!84 = !DILocation(line: 155, column: 5, scope: !69)
!85 = !DILocation(line: 156, column: 5, scope: !69)
!86 = !DILocation(line: 158, column: 5, scope: !69)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 64, type: !22, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !13, line: 66, type: !6)
!89 = !DILocation(line: 66, column: 12, scope: !87)
!90 = !DILocation(line: 67, column: 10, scope: !87)
!91 = !DILocation(line: 68, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !13, line: 68, column: 8)
!93 = !DILocation(line: 68, column: 8, scope: !87)
!94 = !DILocation(line: 71, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !13, line: 69, column: 5)
!96 = !DILocation(line: 72, column: 5, scope: !95)
!97 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !13, line: 76, type: !6)
!98 = distinct !DILexicalBlock(scope: !99, file: !13, line: 75, column: 9)
!99 = distinct !DILexicalBlock(scope: !92, file: !13, line: 74, column: 5)
!100 = !DILocation(line: 76, column: 20, scope: !98)
!101 = !DILocation(line: 76, column: 41, scope: !98)
!102 = !DILocation(line: 77, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !13, line: 77, column: 17)
!104 = !DILocation(line: 77, column: 28, scope: !103)
!105 = !DILocation(line: 77, column: 17, scope: !98)
!106 = !DILocation(line: 77, column: 38, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !13, line: 77, column: 37)
!108 = !DILocation(line: 78, column: 20, scope: !98)
!109 = !DILocation(line: 78, column: 13, scope: !98)
!110 = !DILocation(line: 79, column: 13, scope: !98)
!111 = !DILocation(line: 79, column: 31, scope: !98)
!112 = !DILocation(line: 81, column: 20, scope: !98)
!113 = !DILocation(line: 81, column: 18, scope: !98)
!114 = !DILocalVariable(name: "source", scope: !115, file: !13, line: 85, type: !51)
!115 = distinct !DILexicalBlock(scope: !87, file: !13, line: 84, column: 5)
!116 = !DILocation(line: 85, column: 14, scope: !115)
!117 = !DILocation(line: 86, column: 9, scope: !115)
!118 = !DILocation(line: 87, column: 9, scope: !115)
!119 = !DILocation(line: 87, column: 23, scope: !115)
!120 = !DILocation(line: 89, column: 17, scope: !115)
!121 = !DILocation(line: 89, column: 9, scope: !115)
!122 = !DILocation(line: 91, column: 9, scope: !115)
!123 = !DILocation(line: 91, column: 21, scope: !115)
!124 = !DILocation(line: 92, column: 19, scope: !115)
!125 = !DILocation(line: 92, column: 9, scope: !115)
!126 = !DILocation(line: 96, column: 1, scope: !87)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 99, type: !22, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !13, line: 101, type: !6)
!129 = !DILocation(line: 101, column: 12, scope: !127)
!130 = !DILocation(line: 102, column: 10, scope: !127)
!131 = !DILocation(line: 103, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !13, line: 103, column: 8)
!133 = !DILocation(line: 103, column: 8, scope: !127)
!134 = !DILocalVariable(name: "dataBuffer", scope: !135, file: !13, line: 106, type: !6)
!135 = distinct !DILexicalBlock(scope: !136, file: !13, line: 105, column: 9)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 104, column: 5)
!137 = !DILocation(line: 106, column: 20, scope: !135)
!138 = !DILocation(line: 106, column: 41, scope: !135)
!139 = !DILocation(line: 107, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !13, line: 107, column: 17)
!141 = !DILocation(line: 107, column: 28, scope: !140)
!142 = !DILocation(line: 107, column: 17, scope: !135)
!143 = !DILocation(line: 107, column: 38, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !13, line: 107, column: 37)
!145 = !DILocation(line: 108, column: 20, scope: !135)
!146 = !DILocation(line: 108, column: 13, scope: !135)
!147 = !DILocation(line: 109, column: 13, scope: !135)
!148 = !DILocation(line: 109, column: 31, scope: !135)
!149 = !DILocation(line: 111, column: 20, scope: !135)
!150 = !DILocation(line: 111, column: 18, scope: !135)
!151 = !DILocation(line: 113, column: 5, scope: !136)
!152 = !DILocalVariable(name: "source", scope: !153, file: !13, line: 115, type: !51)
!153 = distinct !DILexicalBlock(scope: !127, file: !13, line: 114, column: 5)
!154 = !DILocation(line: 115, column: 14, scope: !153)
!155 = !DILocation(line: 116, column: 9, scope: !153)
!156 = !DILocation(line: 117, column: 9, scope: !153)
!157 = !DILocation(line: 117, column: 23, scope: !153)
!158 = !DILocation(line: 119, column: 17, scope: !153)
!159 = !DILocation(line: 119, column: 9, scope: !153)
!160 = !DILocation(line: 121, column: 9, scope: !153)
!161 = !DILocation(line: 121, column: 21, scope: !153)
!162 = !DILocation(line: 122, column: 19, scope: !153)
!163 = !DILocation(line: 122, column: 9, scope: !153)
!164 = !DILocation(line: 126, column: 1, scope: !127)
