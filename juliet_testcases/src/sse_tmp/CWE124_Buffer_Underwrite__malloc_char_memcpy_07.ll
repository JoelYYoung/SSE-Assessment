; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memcpy_07_bad() #0 !dbg !19 {
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
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !33
  store i8* %call, i8** %dataBuffer, align 8, !dbg !32
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !38
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !58
  %6 = load i8*, i8** %data, align 8, !dbg !59
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !59
  store i8 0, i8* %arrayidx6, align 1, !dbg !60
  %7 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* %7), !dbg !62
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memcpy_07_good() #0 !dbg !64 {
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
  %call = call i64 @time(i64* null) #7, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #7, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE124_Buffer_Underwrite__malloc_char_memcpy_07_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__malloc_char_memcpy_07_bad(), !dbg !83
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
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %0 = load i32, i32* @staticFive, align 4, !dbg !90
  %cmp = icmp ne i32 %0, 5, !dbg !92
  br i1 %cmp, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !101
  store i8* %call, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  %cmp1 = icmp eq i8* %1, null, !dbg !104
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !105

if.then2:                                         ; preds = %if.else
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
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !117
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx4, align 1, !dbg !119
  %5 = load i8*, i8** %data, align 8, !dbg !120
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !122
  store i8 0, i8* %arrayidx6, align 1, !dbg !123
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !131
  %cmp = icmp eq i32 %0, 5, !dbg !133
  br i1 %cmp, label %if.then, label %if.end3, !dbg !134

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !135, metadata !DIExpression()), !dbg !138
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !139
  store i8* %call, i8** %dataBuffer, align 8, !dbg !138
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !140
  %cmp1 = icmp eq i8* %1, null, !dbg !142
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !143

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !147
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !150
  store i8* %4, i8** %data, align 8, !dbg !151
  br label %if.end3, !dbg !152

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !153, metadata !DIExpression()), !dbg !155
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !156
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx4, align 1, !dbg !158
  %5 = load i8*, i8** %data, align 8, !dbg !159
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !160
  %6 = load i8*, i8** %data, align 8, !dbg !161
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !161
  store i8 0, i8* %arrayidx6, align 1, !dbg !162
  %7 = load i8*, i8** %data, align 8, !dbg !163
  call void @printLine(i8* %7), !dbg !164
  ret void, !dbg !165
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
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!57 = !DILocation(line: 49, column: 16, scope: !49)
!58 = !DILocation(line: 49, column: 9, scope: !49)
!59 = !DILocation(line: 51, column: 9, scope: !49)
!60 = !DILocation(line: 51, column: 21, scope: !49)
!61 = !DILocation(line: 52, column: 19, scope: !49)
!62 = !DILocation(line: 52, column: 9, scope: !49)
!63 = !DILocation(line: 56, column: 1, scope: !19)
!64 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_07_good", scope: !11, file: !11, line: 127, type: !20, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 129, column: 5, scope: !64)
!66 = !DILocation(line: 130, column: 5, scope: !64)
!67 = !DILocation(line: 131, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 143, type: !69, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!12, !12, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !11, line: 143, type: !12)
!73 = !DILocation(line: 143, column: 14, scope: !68)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !11, line: 143, type: !71)
!75 = !DILocation(line: 143, column: 27, scope: !68)
!76 = !DILocation(line: 146, column: 22, scope: !68)
!77 = !DILocation(line: 146, column: 12, scope: !68)
!78 = !DILocation(line: 146, column: 5, scope: !68)
!79 = !DILocation(line: 148, column: 5, scope: !68)
!80 = !DILocation(line: 149, column: 5, scope: !68)
!81 = !DILocation(line: 150, column: 5, scope: !68)
!82 = !DILocation(line: 153, column: 5, scope: !68)
!83 = !DILocation(line: 154, column: 5, scope: !68)
!84 = !DILocation(line: 155, column: 5, scope: !68)
!85 = !DILocation(line: 157, column: 5, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !11, line: 65, type: !6)
!88 = !DILocation(line: 65, column: 12, scope: !86)
!89 = !DILocation(line: 66, column: 10, scope: !86)
!90 = !DILocation(line: 67, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !11, line: 67, column: 8)
!92 = !DILocation(line: 67, column: 18, scope: !91)
!93 = !DILocation(line: 67, column: 8, scope: !86)
!94 = !DILocation(line: 70, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !11, line: 68, column: 5)
!96 = !DILocation(line: 71, column: 5, scope: !95)
!97 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !11, line: 75, type: !6)
!98 = distinct !DILexicalBlock(scope: !99, file: !11, line: 74, column: 9)
!99 = distinct !DILexicalBlock(scope: !91, file: !11, line: 73, column: 5)
!100 = !DILocation(line: 75, column: 20, scope: !98)
!101 = !DILocation(line: 75, column: 41, scope: !98)
!102 = !DILocation(line: 76, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !11, line: 76, column: 17)
!104 = !DILocation(line: 76, column: 28, scope: !103)
!105 = !DILocation(line: 76, column: 17, scope: !98)
!106 = !DILocation(line: 76, column: 38, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !11, line: 76, column: 37)
!108 = !DILocation(line: 77, column: 20, scope: !98)
!109 = !DILocation(line: 77, column: 13, scope: !98)
!110 = !DILocation(line: 78, column: 13, scope: !98)
!111 = !DILocation(line: 78, column: 31, scope: !98)
!112 = !DILocation(line: 80, column: 20, scope: !98)
!113 = !DILocation(line: 80, column: 18, scope: !98)
!114 = !DILocalVariable(name: "source", scope: !115, file: !11, line: 84, type: !50)
!115 = distinct !DILexicalBlock(scope: !86, file: !11, line: 83, column: 5)
!116 = !DILocation(line: 84, column: 14, scope: !115)
!117 = !DILocation(line: 85, column: 9, scope: !115)
!118 = !DILocation(line: 86, column: 9, scope: !115)
!119 = !DILocation(line: 86, column: 23, scope: !115)
!120 = !DILocation(line: 88, column: 16, scope: !115)
!121 = !DILocation(line: 88, column: 9, scope: !115)
!122 = !DILocation(line: 90, column: 9, scope: !115)
!123 = !DILocation(line: 90, column: 21, scope: !115)
!124 = !DILocation(line: 91, column: 19, scope: !115)
!125 = !DILocation(line: 91, column: 9, scope: !115)
!126 = !DILocation(line: 95, column: 1, scope: !86)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 98, type: !20, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !11, line: 100, type: !6)
!129 = !DILocation(line: 100, column: 12, scope: !127)
!130 = !DILocation(line: 101, column: 10, scope: !127)
!131 = !DILocation(line: 102, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !11, line: 102, column: 8)
!133 = !DILocation(line: 102, column: 18, scope: !132)
!134 = !DILocation(line: 102, column: 8, scope: !127)
!135 = !DILocalVariable(name: "dataBuffer", scope: !136, file: !11, line: 105, type: !6)
!136 = distinct !DILexicalBlock(scope: !137, file: !11, line: 104, column: 9)
!137 = distinct !DILexicalBlock(scope: !132, file: !11, line: 103, column: 5)
!138 = !DILocation(line: 105, column: 20, scope: !136)
!139 = !DILocation(line: 105, column: 41, scope: !136)
!140 = !DILocation(line: 106, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !11, line: 106, column: 17)
!142 = !DILocation(line: 106, column: 28, scope: !141)
!143 = !DILocation(line: 106, column: 17, scope: !136)
!144 = !DILocation(line: 106, column: 38, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !11, line: 106, column: 37)
!146 = !DILocation(line: 107, column: 20, scope: !136)
!147 = !DILocation(line: 107, column: 13, scope: !136)
!148 = !DILocation(line: 108, column: 13, scope: !136)
!149 = !DILocation(line: 108, column: 31, scope: !136)
!150 = !DILocation(line: 110, column: 20, scope: !136)
!151 = !DILocation(line: 110, column: 18, scope: !136)
!152 = !DILocation(line: 112, column: 5, scope: !137)
!153 = !DILocalVariable(name: "source", scope: !154, file: !11, line: 114, type: !50)
!154 = distinct !DILexicalBlock(scope: !127, file: !11, line: 113, column: 5)
!155 = !DILocation(line: 114, column: 14, scope: !154)
!156 = !DILocation(line: 115, column: 9, scope: !154)
!157 = !DILocation(line: 116, column: 9, scope: !154)
!158 = !DILocation(line: 116, column: 23, scope: !154)
!159 = !DILocation(line: 118, column: 16, scope: !154)
!160 = !DILocation(line: 118, column: 9, scope: !154)
!161 = !DILocation(line: 120, column: 9, scope: !154)
!162 = !DILocation(line: 120, column: 21, scope: !154)
!163 = !DILocation(line: 121, column: 19, scope: !154)
!164 = !DILocation(line: 121, column: 9, scope: !154)
!165 = !DILocation(line: 125, column: 1, scope: !127)
