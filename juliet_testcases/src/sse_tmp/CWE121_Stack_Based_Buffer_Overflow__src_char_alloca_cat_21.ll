; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  store i8* %1, i8** %data, align 8, !dbg !31
  store i32 1, i32* @badStatic, align 4, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i8* @badSource(i8* %2), !dbg !34
  store i8* %call, i8** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #5, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %5), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* @badStatic, align 4, !dbg !53
  %tobool = icmp ne i32 %0, 0, !dbg !53
  br i1 %tobool, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !58
  %2 = load i8*, i8** %data.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !59
  store i8 0, i8* %arrayidx, align 1, !dbg !60
  br label %if.end, !dbg !61

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !62
  ret i8* %3, !dbg !63
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21_good() #0 !dbg !64 {
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
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 100, align 16, !dbg !91
  store i8* %0, i8** %dataBuffer, align 8, !dbg !90
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  store i8* %1, i8** %data, align 8, !dbg !93
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %call = call i8* @goodG2B1Source(i8* %2), !dbg !96
  store i8* %call, i8** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #5, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %5), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !107 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !110
  %tobool = icmp ne i32 %0, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !118
  %2 = load i8*, i8** %data.addr, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !121
  ret i8* %3, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = alloca i8, i64 100, align 16, !dbg !128
  store i8* %0, i8** %dataBuffer, align 8, !dbg !127
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !129
  store i8* %1, i8** %data, align 8, !dbg !130
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !131
  %2 = load i8*, i8** %data, align 8, !dbg !132
  %call = call i8* @goodG2B2Source(i8* %2), !dbg !133
  store i8* %call, i8** %data, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !137
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !137
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !138
  %4 = load i8*, i8** %data, align 8, !dbg !139
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #5, !dbg !140
  %5 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* %5), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !144 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !147
  %tobool = icmp ne i32 %0, 0, !dbg !147
  br i1 %tobool, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !152
  %2 = load i8*, i8** %data.addr, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !156
  ret i8* %3, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !12, line: 24, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !12, line: 57, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !12, line: 58, type: !13, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21_bad", scope: !12, file: !12, line: 37, type: !23, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 39, type: !6)
!26 = !DILocation(line: 39, column: 12, scope: !22)
!27 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !12, line: 40, type: !6)
!28 = !DILocation(line: 40, column: 12, scope: !22)
!29 = !DILocation(line: 40, column: 33, scope: !22)
!30 = !DILocation(line: 41, column: 12, scope: !22)
!31 = !DILocation(line: 41, column: 10, scope: !22)
!32 = !DILocation(line: 42, column: 15, scope: !22)
!33 = !DILocation(line: 43, column: 22, scope: !22)
!34 = !DILocation(line: 43, column: 12, scope: !22)
!35 = !DILocation(line: 43, column: 10, scope: !22)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 45, type: !38)
!37 = distinct !DILexicalBlock(scope: !22, file: !12, line: 44, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 45, column: 14, scope: !37)
!42 = !DILocation(line: 47, column: 16, scope: !37)
!43 = !DILocation(line: 47, column: 22, scope: !37)
!44 = !DILocation(line: 47, column: 9, scope: !37)
!45 = !DILocation(line: 48, column: 19, scope: !37)
!46 = !DILocation(line: 48, column: 9, scope: !37)
!47 = !DILocation(line: 50, column: 1, scope: !22)
!48 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 26, type: !49, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!6, !6}
!51 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !12, line: 26, type: !6)
!52 = !DILocation(line: 26, column: 32, scope: !48)
!53 = !DILocation(line: 28, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !12, line: 28, column: 8)
!55 = !DILocation(line: 28, column: 8, scope: !48)
!56 = !DILocation(line: 31, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 29, column: 5)
!58 = !DILocation(line: 31, column: 9, scope: !57)
!59 = !DILocation(line: 32, column: 9, scope: !57)
!60 = !DILocation(line: 32, column: 21, scope: !57)
!61 = !DILocation(line: 33, column: 5, scope: !57)
!62 = !DILocation(line: 34, column: 12, scope: !48)
!63 = !DILocation(line: 34, column: 5, scope: !48)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_21_good", scope: !12, file: !12, line: 119, type: !23, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 121, column: 5, scope: !64)
!66 = !DILocation(line: 122, column: 5, scope: !64)
!67 = !DILocation(line: 123, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !69, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!13, !13, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 135, type: !13)
!73 = !DILocation(line: 135, column: 14, scope: !68)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 135, type: !71)
!75 = !DILocation(line: 135, column: 27, scope: !68)
!76 = !DILocation(line: 138, column: 22, scope: !68)
!77 = !DILocation(line: 138, column: 12, scope: !68)
!78 = !DILocation(line: 138, column: 5, scope: !68)
!79 = !DILocation(line: 140, column: 5, scope: !68)
!80 = !DILocation(line: 141, column: 5, scope: !68)
!81 = !DILocation(line: 142, column: 5, scope: !68)
!82 = !DILocation(line: 145, column: 5, scope: !68)
!83 = !DILocation(line: 146, column: 5, scope: !68)
!84 = !DILocation(line: 147, column: 5, scope: !68)
!85 = !DILocation(line: 149, column: 5, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 77, type: !23, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 79, type: !6)
!88 = !DILocation(line: 79, column: 12, scope: !86)
!89 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !12, line: 80, type: !6)
!90 = !DILocation(line: 80, column: 12, scope: !86)
!91 = !DILocation(line: 80, column: 33, scope: !86)
!92 = !DILocation(line: 81, column: 12, scope: !86)
!93 = !DILocation(line: 81, column: 10, scope: !86)
!94 = !DILocation(line: 82, column: 20, scope: !86)
!95 = !DILocation(line: 83, column: 27, scope: !86)
!96 = !DILocation(line: 83, column: 12, scope: !86)
!97 = !DILocation(line: 83, column: 10, scope: !86)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !12, line: 85, type: !38)
!99 = distinct !DILexicalBlock(scope: !86, file: !12, line: 84, column: 5)
!100 = !DILocation(line: 85, column: 14, scope: !99)
!101 = !DILocation(line: 87, column: 16, scope: !99)
!102 = !DILocation(line: 87, column: 22, scope: !99)
!103 = !DILocation(line: 87, column: 9, scope: !99)
!104 = !DILocation(line: 88, column: 19, scope: !99)
!105 = !DILocation(line: 88, column: 9, scope: !99)
!106 = !DILocation(line: 90, column: 1, scope: !86)
!107 = distinct !DISubprogram(name: "goodG2B1Source", scope: !12, file: !12, line: 61, type: !49, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", arg: 1, scope: !107, file: !12, line: 61, type: !6)
!109 = !DILocation(line: 61, column: 37, scope: !107)
!110 = !DILocation(line: 63, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 63, column: 8)
!112 = !DILocation(line: 63, column: 8, scope: !107)
!113 = !DILocation(line: 66, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 64, column: 5)
!115 = !DILocation(line: 67, column: 5, scope: !114)
!116 = !DILocation(line: 71, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !12, line: 69, column: 5)
!118 = !DILocation(line: 71, column: 9, scope: !117)
!119 = !DILocation(line: 72, column: 9, scope: !117)
!120 = !DILocation(line: 72, column: 20, scope: !117)
!121 = !DILocation(line: 74, column: 12, scope: !107)
!122 = !DILocation(line: 74, column: 5, scope: !107)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 104, type: !23, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 106, type: !6)
!125 = !DILocation(line: 106, column: 12, scope: !123)
!126 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !12, line: 107, type: !6)
!127 = !DILocation(line: 107, column: 12, scope: !123)
!128 = !DILocation(line: 107, column: 33, scope: !123)
!129 = !DILocation(line: 108, column: 12, scope: !123)
!130 = !DILocation(line: 108, column: 10, scope: !123)
!131 = !DILocation(line: 109, column: 20, scope: !123)
!132 = !DILocation(line: 110, column: 27, scope: !123)
!133 = !DILocation(line: 110, column: 12, scope: !123)
!134 = !DILocation(line: 110, column: 10, scope: !123)
!135 = !DILocalVariable(name: "dest", scope: !136, file: !12, line: 112, type: !38)
!136 = distinct !DILexicalBlock(scope: !123, file: !12, line: 111, column: 5)
!137 = !DILocation(line: 112, column: 14, scope: !136)
!138 = !DILocation(line: 114, column: 16, scope: !136)
!139 = !DILocation(line: 114, column: 22, scope: !136)
!140 = !DILocation(line: 114, column: 9, scope: !136)
!141 = !DILocation(line: 115, column: 19, scope: !136)
!142 = !DILocation(line: 115, column: 9, scope: !136)
!143 = !DILocation(line: 117, column: 1, scope: !123)
!144 = distinct !DISubprogram(name: "goodG2B2Source", scope: !12, file: !12, line: 93, type: !49, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocalVariable(name: "data", arg: 1, scope: !144, file: !12, line: 93, type: !6)
!146 = !DILocation(line: 93, column: 37, scope: !144)
!147 = !DILocation(line: 95, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !12, line: 95, column: 8)
!149 = !DILocation(line: 95, column: 8, scope: !144)
!150 = !DILocation(line: 98, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 96, column: 5)
!152 = !DILocation(line: 98, column: 9, scope: !151)
!153 = !DILocation(line: 99, column: 9, scope: !151)
!154 = !DILocation(line: 99, column: 20, scope: !151)
!155 = !DILocation(line: 100, column: 5, scope: !151)
!156 = !DILocation(line: 101, column: 12, scope: !144)
!157 = !DILocation(line: 101, column: 5, scope: !144)
