; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_05.c"
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_05_bad() #0 !dbg !21 {
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
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !34
  store i8* %call, i8** %dataBuffer, align 8, !dbg !33
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i8* %1, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !39
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
  %call5 = call i8* @strncpy(i8* %5, i8* %arraydecay4, i64 99) #6, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !61
  store i8 0, i8* %arrayidx6, align 1, !dbg !62
  %7 = load i8*, i8** %data, align 8, !dbg !63
  call void @printLine(i8* %7), !dbg !64
  ret void, !dbg !65
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_05_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_05_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_05_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i8* null, i8** %data, align 8, !dbg !91
  %0 = load i32, i32* @staticFalse, align 4, !dbg !92
  %tobool = icmp ne i32 %0, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end2, !dbg !97

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !102
  store i8* %call, i8** %dataBuffer, align 8, !dbg !101
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  %cmp = icmp eq i8* %1, null, !dbg !105
  br i1 %cmp, label %if.then1, label %if.end, !dbg !106

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !110
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  store i8* %4, i8** %data, align 8, !dbg !114
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !118
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx3, align 1, !dbg !120
  %5 = load i8*, i8** %data, align 8, !dbg !121
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  %call5 = call i8* @strncpy(i8* %5, i8* %arraydecay4, i64 99) #6, !dbg !123
  %6 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !124
  store i8 0, i8* %arrayidx6, align 1, !dbg !125
  %7 = load i8*, i8** %data, align 8, !dbg !126
  call void @printLine(i8* %7), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !129 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i8* null, i8** %data, align 8, !dbg !132
  %0 = load i32, i32* @staticTrue, align 4, !dbg !133
  %tobool = icmp ne i32 %0, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.end2, !dbg !135

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !136, metadata !DIExpression()), !dbg !139
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !140
  store i8* %call, i8** %dataBuffer, align 8, !dbg !139
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !141
  %cmp = icmp eq i8* %1, null, !dbg !143
  br i1 %cmp, label %if.then1, label %if.end, !dbg !144

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !148
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !149
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !151
  store i8* %4, i8** %data, align 8, !dbg !152
  br label %if.end2, !dbg !153

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !157
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !158
  store i8 0, i8* %arrayidx3, align 1, !dbg !159
  %5 = load i8*, i8** %data, align 8, !dbg !160
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !161
  %call5 = call i8* @strncpy(i8* %5, i8* %arraydecay4, i64 99) #6, !dbg !162
  %6 = load i8*, i8** %data, align 8, !dbg !163
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !163
  store i8 0, i8* %arrayidx6, align 1, !dbg !164
  %7 = load i8*, i8** %data, align 8, !dbg !165
  call void @printLine(i8* %7), !dbg !166
  ret void, !dbg !167
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!59 = !DILocation(line: 50, column: 23, scope: !50)
!60 = !DILocation(line: 50, column: 9, scope: !50)
!61 = !DILocation(line: 52, column: 9, scope: !50)
!62 = !DILocation(line: 52, column: 21, scope: !50)
!63 = !DILocation(line: 53, column: 19, scope: !50)
!64 = !DILocation(line: 53, column: 9, scope: !50)
!65 = !DILocation(line: 57, column: 1, scope: !21)
!66 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_05_good", scope: !13, file: !13, line: 128, type: !22, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 130, column: 5, scope: !66)
!68 = !DILocation(line: 131, column: 5, scope: !66)
!69 = !DILocation(line: 132, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 144, type: !71, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!14, !14, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !13, line: 144, type: !14)
!75 = !DILocation(line: 144, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !13, line: 144, type: !73)
!77 = !DILocation(line: 144, column: 27, scope: !70)
!78 = !DILocation(line: 147, column: 22, scope: !70)
!79 = !DILocation(line: 147, column: 12, scope: !70)
!80 = !DILocation(line: 147, column: 5, scope: !70)
!81 = !DILocation(line: 149, column: 5, scope: !70)
!82 = !DILocation(line: 150, column: 5, scope: !70)
!83 = !DILocation(line: 151, column: 5, scope: !70)
!84 = !DILocation(line: 154, column: 5, scope: !70)
!85 = !DILocation(line: 155, column: 5, scope: !70)
!86 = !DILocation(line: 156, column: 5, scope: !70)
!87 = !DILocation(line: 158, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 64, type: !22, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !13, line: 66, type: !6)
!90 = !DILocation(line: 66, column: 12, scope: !88)
!91 = !DILocation(line: 67, column: 10, scope: !88)
!92 = !DILocation(line: 68, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !13, line: 68, column: 8)
!94 = !DILocation(line: 68, column: 8, scope: !88)
!95 = !DILocation(line: 71, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !13, line: 69, column: 5)
!97 = !DILocation(line: 72, column: 5, scope: !96)
!98 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !13, line: 76, type: !6)
!99 = distinct !DILexicalBlock(scope: !100, file: !13, line: 75, column: 9)
!100 = distinct !DILexicalBlock(scope: !93, file: !13, line: 74, column: 5)
!101 = !DILocation(line: 76, column: 20, scope: !99)
!102 = !DILocation(line: 76, column: 41, scope: !99)
!103 = !DILocation(line: 77, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !13, line: 77, column: 17)
!105 = !DILocation(line: 77, column: 28, scope: !104)
!106 = !DILocation(line: 77, column: 17, scope: !99)
!107 = !DILocation(line: 77, column: 38, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !13, line: 77, column: 37)
!109 = !DILocation(line: 78, column: 20, scope: !99)
!110 = !DILocation(line: 78, column: 13, scope: !99)
!111 = !DILocation(line: 79, column: 13, scope: !99)
!112 = !DILocation(line: 79, column: 31, scope: !99)
!113 = !DILocation(line: 81, column: 20, scope: !99)
!114 = !DILocation(line: 81, column: 18, scope: !99)
!115 = !DILocalVariable(name: "source", scope: !116, file: !13, line: 85, type: !51)
!116 = distinct !DILexicalBlock(scope: !88, file: !13, line: 84, column: 5)
!117 = !DILocation(line: 85, column: 14, scope: !116)
!118 = !DILocation(line: 86, column: 9, scope: !116)
!119 = !DILocation(line: 87, column: 9, scope: !116)
!120 = !DILocation(line: 87, column: 23, scope: !116)
!121 = !DILocation(line: 89, column: 17, scope: !116)
!122 = !DILocation(line: 89, column: 23, scope: !116)
!123 = !DILocation(line: 89, column: 9, scope: !116)
!124 = !DILocation(line: 91, column: 9, scope: !116)
!125 = !DILocation(line: 91, column: 21, scope: !116)
!126 = !DILocation(line: 92, column: 19, scope: !116)
!127 = !DILocation(line: 92, column: 9, scope: !116)
!128 = !DILocation(line: 96, column: 1, scope: !88)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 99, type: !22, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !13, line: 101, type: !6)
!131 = !DILocation(line: 101, column: 12, scope: !129)
!132 = !DILocation(line: 102, column: 10, scope: !129)
!133 = !DILocation(line: 103, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !13, line: 103, column: 8)
!135 = !DILocation(line: 103, column: 8, scope: !129)
!136 = !DILocalVariable(name: "dataBuffer", scope: !137, file: !13, line: 106, type: !6)
!137 = distinct !DILexicalBlock(scope: !138, file: !13, line: 105, column: 9)
!138 = distinct !DILexicalBlock(scope: !134, file: !13, line: 104, column: 5)
!139 = !DILocation(line: 106, column: 20, scope: !137)
!140 = !DILocation(line: 106, column: 41, scope: !137)
!141 = !DILocation(line: 107, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !13, line: 107, column: 17)
!143 = !DILocation(line: 107, column: 28, scope: !142)
!144 = !DILocation(line: 107, column: 17, scope: !137)
!145 = !DILocation(line: 107, column: 38, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !13, line: 107, column: 37)
!147 = !DILocation(line: 108, column: 20, scope: !137)
!148 = !DILocation(line: 108, column: 13, scope: !137)
!149 = !DILocation(line: 109, column: 13, scope: !137)
!150 = !DILocation(line: 109, column: 31, scope: !137)
!151 = !DILocation(line: 111, column: 20, scope: !137)
!152 = !DILocation(line: 111, column: 18, scope: !137)
!153 = !DILocation(line: 113, column: 5, scope: !138)
!154 = !DILocalVariable(name: "source", scope: !155, file: !13, line: 115, type: !51)
!155 = distinct !DILexicalBlock(scope: !129, file: !13, line: 114, column: 5)
!156 = !DILocation(line: 115, column: 14, scope: !155)
!157 = !DILocation(line: 116, column: 9, scope: !155)
!158 = !DILocation(line: 117, column: 9, scope: !155)
!159 = !DILocation(line: 117, column: 23, scope: !155)
!160 = !DILocation(line: 119, column: 17, scope: !155)
!161 = !DILocation(line: 119, column: 23, scope: !155)
!162 = !DILocation(line: 119, column: 9, scope: !155)
!163 = !DILocation(line: 121, column: 9, scope: !155)
!164 = !DILocation(line: 121, column: 21, scope: !155)
!165 = !DILocation(line: 122, column: 19, scope: !155)
!166 = !DILocation(line: 122, column: 9, scope: !155)
!167 = !DILocation(line: 126, column: 1, scope: !129)
