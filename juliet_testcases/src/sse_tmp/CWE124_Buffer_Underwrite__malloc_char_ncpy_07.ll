; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx4, align 1, !dbg !56
  %5 = load i8*, i8** %data, align 8, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !58
  %call6 = call i8* @strncpy(i8* %5, i8* %arraydecay5, i64 99) #6, !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !60
  store i8 0, i8* %arrayidx7, align 1, !dbg !61
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

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_07_good() #0 !dbg !65 {
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
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_07_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_07_bad(), !dbg !84
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !91
  %cmp = icmp ne i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end3, !dbg !97

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !102
  store i8* %call, i8** %dataBuffer, align 8, !dbg !101
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  %cmp1 = icmp eq i8* %1, null, !dbg !105
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !106

if.then2:                                         ; preds = %if.else
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
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !118
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx4, align 1, !dbg !120
  %5 = load i8*, i8** %data, align 8, !dbg !121
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  %call6 = call i8* @strncpy(i8* %5, i8* %arraydecay5, i64 99) #6, !dbg !123
  %6 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !124
  store i8 0, i8* %arrayidx7, align 1, !dbg !125
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !133
  %cmp = icmp eq i32 %0, 5, !dbg !135
  br i1 %cmp, label %if.then, label %if.end3, !dbg !136

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !137, metadata !DIExpression()), !dbg !140
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !141
  store i8* %call, i8** %dataBuffer, align 8, !dbg !140
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !142
  %cmp1 = icmp eq i8* %1, null, !dbg !144
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !145

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !149
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !150
  store i8 0, i8* %arrayidx, align 1, !dbg !151
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !152
  store i8* %4, i8** %data, align 8, !dbg !153
  br label %if.end3, !dbg !154

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !155, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !158
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !159
  store i8 0, i8* %arrayidx4, align 1, !dbg !160
  %5 = load i8*, i8** %data, align 8, !dbg !161
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !162
  %call6 = call i8* @strncpy(i8* %5, i8* %arraydecay5, i64 99) #6, !dbg !163
  %6 = load i8*, i8** %data, align 8, !dbg !164
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !164
  store i8 0, i8* %arrayidx7, align 1, !dbg !165
  %7 = load i8*, i8** %data, align 8, !dbg !166
  call void @printLine(i8* %7), !dbg !167
  ret void, !dbg !168
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!48 = !DILocalVariable(name: "source", scope: !49, file: !11, line: 45, type: !50)
!49 = distinct !DILexicalBlock(scope: !19, file: !11, line: 44, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 45, column: 14, scope: !49)
!54 = !DILocation(line: 46, column: 9, scope: !49)
!55 = !DILocation(line: 47, column: 9, scope: !49)
!56 = !DILocation(line: 47, column: 23, scope: !49)
!57 = !DILocation(line: 49, column: 17, scope: !49)
!58 = !DILocation(line: 49, column: 23, scope: !49)
!59 = !DILocation(line: 49, column: 9, scope: !49)
!60 = !DILocation(line: 51, column: 9, scope: !49)
!61 = !DILocation(line: 51, column: 21, scope: !49)
!62 = !DILocation(line: 52, column: 19, scope: !49)
!63 = !DILocation(line: 52, column: 9, scope: !49)
!64 = !DILocation(line: 56, column: 1, scope: !19)
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_07_good", scope: !11, file: !11, line: 127, type: !20, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 129, column: 5, scope: !65)
!67 = !DILocation(line: 130, column: 5, scope: !65)
!68 = !DILocation(line: 131, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 143, type: !70, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DISubroutineType(types: !71)
!71 = !{!12, !12, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !11, line: 143, type: !12)
!74 = !DILocation(line: 143, column: 14, scope: !69)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !11, line: 143, type: !72)
!76 = !DILocation(line: 143, column: 27, scope: !69)
!77 = !DILocation(line: 146, column: 22, scope: !69)
!78 = !DILocation(line: 146, column: 12, scope: !69)
!79 = !DILocation(line: 146, column: 5, scope: !69)
!80 = !DILocation(line: 148, column: 5, scope: !69)
!81 = !DILocation(line: 149, column: 5, scope: !69)
!82 = !DILocation(line: 150, column: 5, scope: !69)
!83 = !DILocation(line: 153, column: 5, scope: !69)
!84 = !DILocation(line: 154, column: 5, scope: !69)
!85 = !DILocation(line: 155, column: 5, scope: !69)
!86 = !DILocation(line: 157, column: 5, scope: !69)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !11, line: 65, type: !6)
!89 = !DILocation(line: 65, column: 12, scope: !87)
!90 = !DILocation(line: 66, column: 10, scope: !87)
!91 = !DILocation(line: 67, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !11, line: 67, column: 8)
!93 = !DILocation(line: 67, column: 18, scope: !92)
!94 = !DILocation(line: 67, column: 8, scope: !87)
!95 = !DILocation(line: 70, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !11, line: 68, column: 5)
!97 = !DILocation(line: 71, column: 5, scope: !96)
!98 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !11, line: 75, type: !6)
!99 = distinct !DILexicalBlock(scope: !100, file: !11, line: 74, column: 9)
!100 = distinct !DILexicalBlock(scope: !92, file: !11, line: 73, column: 5)
!101 = !DILocation(line: 75, column: 20, scope: !99)
!102 = !DILocation(line: 75, column: 41, scope: !99)
!103 = !DILocation(line: 76, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !11, line: 76, column: 17)
!105 = !DILocation(line: 76, column: 28, scope: !104)
!106 = !DILocation(line: 76, column: 17, scope: !99)
!107 = !DILocation(line: 76, column: 38, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !11, line: 76, column: 37)
!109 = !DILocation(line: 77, column: 20, scope: !99)
!110 = !DILocation(line: 77, column: 13, scope: !99)
!111 = !DILocation(line: 78, column: 13, scope: !99)
!112 = !DILocation(line: 78, column: 31, scope: !99)
!113 = !DILocation(line: 80, column: 20, scope: !99)
!114 = !DILocation(line: 80, column: 18, scope: !99)
!115 = !DILocalVariable(name: "source", scope: !116, file: !11, line: 84, type: !50)
!116 = distinct !DILexicalBlock(scope: !87, file: !11, line: 83, column: 5)
!117 = !DILocation(line: 84, column: 14, scope: !116)
!118 = !DILocation(line: 85, column: 9, scope: !116)
!119 = !DILocation(line: 86, column: 9, scope: !116)
!120 = !DILocation(line: 86, column: 23, scope: !116)
!121 = !DILocation(line: 88, column: 17, scope: !116)
!122 = !DILocation(line: 88, column: 23, scope: !116)
!123 = !DILocation(line: 88, column: 9, scope: !116)
!124 = !DILocation(line: 90, column: 9, scope: !116)
!125 = !DILocation(line: 90, column: 21, scope: !116)
!126 = !DILocation(line: 91, column: 19, scope: !116)
!127 = !DILocation(line: 91, column: 9, scope: !116)
!128 = !DILocation(line: 95, column: 1, scope: !87)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 98, type: !20, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !11, line: 100, type: !6)
!131 = !DILocation(line: 100, column: 12, scope: !129)
!132 = !DILocation(line: 101, column: 10, scope: !129)
!133 = !DILocation(line: 102, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !11, line: 102, column: 8)
!135 = !DILocation(line: 102, column: 18, scope: !134)
!136 = !DILocation(line: 102, column: 8, scope: !129)
!137 = !DILocalVariable(name: "dataBuffer", scope: !138, file: !11, line: 105, type: !6)
!138 = distinct !DILexicalBlock(scope: !139, file: !11, line: 104, column: 9)
!139 = distinct !DILexicalBlock(scope: !134, file: !11, line: 103, column: 5)
!140 = !DILocation(line: 105, column: 20, scope: !138)
!141 = !DILocation(line: 105, column: 41, scope: !138)
!142 = !DILocation(line: 106, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !11, line: 106, column: 17)
!144 = !DILocation(line: 106, column: 28, scope: !143)
!145 = !DILocation(line: 106, column: 17, scope: !138)
!146 = !DILocation(line: 106, column: 38, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !11, line: 106, column: 37)
!148 = !DILocation(line: 107, column: 20, scope: !138)
!149 = !DILocation(line: 107, column: 13, scope: !138)
!150 = !DILocation(line: 108, column: 13, scope: !138)
!151 = !DILocation(line: 108, column: 31, scope: !138)
!152 = !DILocation(line: 110, column: 20, scope: !138)
!153 = !DILocation(line: 110, column: 18, scope: !138)
!154 = !DILocation(line: 112, column: 5, scope: !139)
!155 = !DILocalVariable(name: "source", scope: !156, file: !11, line: 114, type: !50)
!156 = distinct !DILexicalBlock(scope: !129, file: !11, line: 113, column: 5)
!157 = !DILocation(line: 114, column: 14, scope: !156)
!158 = !DILocation(line: 115, column: 9, scope: !156)
!159 = !DILocation(line: 116, column: 9, scope: !156)
!160 = !DILocation(line: 116, column: 23, scope: !156)
!161 = !DILocation(line: 118, column: 17, scope: !156)
!162 = !DILocation(line: 118, column: 23, scope: !156)
!163 = !DILocation(line: 118, column: 9, scope: !156)
!164 = !DILocation(line: 120, column: 9, scope: !156)
!165 = !DILocation(line: 120, column: 21, scope: !156)
!166 = !DILocation(line: 121, column: 19, scope: !156)
!167 = !DILocation(line: 121, column: 9, scope: !156)
!168 = !DILocation(line: 125, column: 1, scope: !129)
