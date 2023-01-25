; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21_bad() #0 !dbg !22 {
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
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !45
  %call2 = call i8* @strncpy(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !46
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %6), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @badStatic, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !62
  %2 = load i8*, i8** %data.addr, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !63
  store i8 0, i8* %arrayidx, align 1, !dbg !64
  br label %if.end, !dbg !65

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !66
  ret i8* %3, !dbg !67
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #7, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #7, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 100, align 16, !dbg !95
  store i8* %0, i8** %dataBuffer, align 8, !dbg !94
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  store i8* %1, i8** %data, align 8, !dbg !97
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !99
  %call = call i8* @goodG2B1Source(i8* %2), !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  %5 = load i8*, i8** %data, align 8, !dbg !107
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !108
  %call2 = call i8* @strncpy(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !109
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %6 = load i8*, i8** %data, align 8, !dbg !112
  call void @printLine(i8* %6), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !115 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !118
  %tobool = icmp ne i32 %0, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !126
  %2 = load i8*, i8** %data.addr, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !129
  ret i8* %3, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !131 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %0 = alloca i8, i64 100, align 16, !dbg !136
  store i8* %0, i8** %dataBuffer, align 8, !dbg !135
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !137
  store i8* %1, i8** %data, align 8, !dbg !138
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !139
  %2 = load i8*, i8** %data, align 8, !dbg !140
  %call = call i8* @goodG2B2Source(i8* %2), !dbg !141
  store i8* %call, i8** %data, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !143, metadata !DIExpression()), !dbg !145
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !145
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !146
  %4 = load i8*, i8** %data, align 8, !dbg !147
  %5 = load i8*, i8** %data, align 8, !dbg !148
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !149
  %call2 = call i8* @strncpy(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !150
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  %6 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* %6), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !156 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !157, metadata !DIExpression()), !dbg !158
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !159
  %tobool = icmp ne i32 %0, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !164
  %2 = load i8*, i8** %data.addr, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !168
  ret i8* %3, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !12, line: 24, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !12, line: 58, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !12, line: 59, type: !13, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21_bad", scope: !12, file: !12, line: 37, type: !23, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!42 = !DILocation(line: 47, column: 17, scope: !37)
!43 = !DILocation(line: 47, column: 23, scope: !37)
!44 = !DILocation(line: 47, column: 36, scope: !37)
!45 = !DILocation(line: 47, column: 29, scope: !37)
!46 = !DILocation(line: 47, column: 9, scope: !37)
!47 = !DILocation(line: 48, column: 9, scope: !37)
!48 = !DILocation(line: 48, column: 20, scope: !37)
!49 = !DILocation(line: 49, column: 19, scope: !37)
!50 = !DILocation(line: 49, column: 9, scope: !37)
!51 = !DILocation(line: 51, column: 1, scope: !22)
!52 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 26, type: !53, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!6, !6}
!55 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !12, line: 26, type: !6)
!56 = !DILocation(line: 26, column: 32, scope: !52)
!57 = !DILocation(line: 28, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !12, line: 28, column: 8)
!59 = !DILocation(line: 28, column: 8, scope: !52)
!60 = !DILocation(line: 31, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 29, column: 5)
!62 = !DILocation(line: 31, column: 9, scope: !61)
!63 = !DILocation(line: 32, column: 9, scope: !61)
!64 = !DILocation(line: 32, column: 21, scope: !61)
!65 = !DILocation(line: 33, column: 5, scope: !61)
!66 = !DILocation(line: 34, column: 12, scope: !52)
!67 = !DILocation(line: 34, column: 5, scope: !52)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_21_good", scope: !12, file: !12, line: 122, type: !23, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 124, column: 5, scope: !68)
!70 = !DILocation(line: 125, column: 5, scope: !68)
!71 = !DILocation(line: 126, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 138, type: !73, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!13, !13, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 138, type: !13)
!77 = !DILocation(line: 138, column: 14, scope: !72)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 138, type: !75)
!79 = !DILocation(line: 138, column: 27, scope: !72)
!80 = !DILocation(line: 141, column: 22, scope: !72)
!81 = !DILocation(line: 141, column: 12, scope: !72)
!82 = !DILocation(line: 141, column: 5, scope: !72)
!83 = !DILocation(line: 143, column: 5, scope: !72)
!84 = !DILocation(line: 144, column: 5, scope: !72)
!85 = !DILocation(line: 145, column: 5, scope: !72)
!86 = !DILocation(line: 148, column: 5, scope: !72)
!87 = !DILocation(line: 149, column: 5, scope: !72)
!88 = !DILocation(line: 150, column: 5, scope: !72)
!89 = !DILocation(line: 152, column: 5, scope: !72)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 78, type: !23, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 80, type: !6)
!92 = !DILocation(line: 80, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !12, line: 81, type: !6)
!94 = !DILocation(line: 81, column: 12, scope: !90)
!95 = !DILocation(line: 81, column: 33, scope: !90)
!96 = !DILocation(line: 82, column: 12, scope: !90)
!97 = !DILocation(line: 82, column: 10, scope: !90)
!98 = !DILocation(line: 83, column: 20, scope: !90)
!99 = !DILocation(line: 84, column: 27, scope: !90)
!100 = !DILocation(line: 84, column: 12, scope: !90)
!101 = !DILocation(line: 84, column: 10, scope: !90)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !12, line: 86, type: !38)
!103 = distinct !DILexicalBlock(scope: !90, file: !12, line: 85, column: 5)
!104 = !DILocation(line: 86, column: 14, scope: !103)
!105 = !DILocation(line: 88, column: 17, scope: !103)
!106 = !DILocation(line: 88, column: 23, scope: !103)
!107 = !DILocation(line: 88, column: 36, scope: !103)
!108 = !DILocation(line: 88, column: 29, scope: !103)
!109 = !DILocation(line: 88, column: 9, scope: !103)
!110 = !DILocation(line: 89, column: 9, scope: !103)
!111 = !DILocation(line: 89, column: 20, scope: !103)
!112 = !DILocation(line: 90, column: 19, scope: !103)
!113 = !DILocation(line: 90, column: 9, scope: !103)
!114 = !DILocation(line: 92, column: 1, scope: !90)
!115 = distinct !DISubprogram(name: "goodG2B1Source", scope: !12, file: !12, line: 62, type: !53, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", arg: 1, scope: !115, file: !12, line: 62, type: !6)
!117 = !DILocation(line: 62, column: 37, scope: !115)
!118 = !DILocation(line: 64, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 64, column: 8)
!120 = !DILocation(line: 64, column: 8, scope: !115)
!121 = !DILocation(line: 67, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 65, column: 5)
!123 = !DILocation(line: 68, column: 5, scope: !122)
!124 = !DILocation(line: 72, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !12, line: 70, column: 5)
!126 = !DILocation(line: 72, column: 9, scope: !125)
!127 = !DILocation(line: 73, column: 9, scope: !125)
!128 = !DILocation(line: 73, column: 20, scope: !125)
!129 = !DILocation(line: 75, column: 12, scope: !115)
!130 = !DILocation(line: 75, column: 5, scope: !115)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 106, type: !23, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "data", scope: !131, file: !12, line: 108, type: !6)
!133 = !DILocation(line: 108, column: 12, scope: !131)
!134 = !DILocalVariable(name: "dataBuffer", scope: !131, file: !12, line: 109, type: !6)
!135 = !DILocation(line: 109, column: 12, scope: !131)
!136 = !DILocation(line: 109, column: 33, scope: !131)
!137 = !DILocation(line: 110, column: 12, scope: !131)
!138 = !DILocation(line: 110, column: 10, scope: !131)
!139 = !DILocation(line: 111, column: 20, scope: !131)
!140 = !DILocation(line: 112, column: 27, scope: !131)
!141 = !DILocation(line: 112, column: 12, scope: !131)
!142 = !DILocation(line: 112, column: 10, scope: !131)
!143 = !DILocalVariable(name: "dest", scope: !144, file: !12, line: 114, type: !38)
!144 = distinct !DILexicalBlock(scope: !131, file: !12, line: 113, column: 5)
!145 = !DILocation(line: 114, column: 14, scope: !144)
!146 = !DILocation(line: 116, column: 17, scope: !144)
!147 = !DILocation(line: 116, column: 23, scope: !144)
!148 = !DILocation(line: 116, column: 36, scope: !144)
!149 = !DILocation(line: 116, column: 29, scope: !144)
!150 = !DILocation(line: 116, column: 9, scope: !144)
!151 = !DILocation(line: 117, column: 9, scope: !144)
!152 = !DILocation(line: 117, column: 20, scope: !144)
!153 = !DILocation(line: 118, column: 19, scope: !144)
!154 = !DILocation(line: 118, column: 9, scope: !144)
!155 = !DILocation(line: 120, column: 1, scope: !131)
!156 = distinct !DISubprogram(name: "goodG2B2Source", scope: !12, file: !12, line: 95, type: !53, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", arg: 1, scope: !156, file: !12, line: 95, type: !6)
!158 = !DILocation(line: 95, column: 37, scope: !156)
!159 = !DILocation(line: 97, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !12, line: 97, column: 8)
!161 = !DILocation(line: 97, column: 8, scope: !156)
!162 = !DILocation(line: 100, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 98, column: 5)
!164 = !DILocation(line: 100, column: 9, scope: !163)
!165 = !DILocation(line: 101, column: 9, scope: !163)
!166 = !DILocation(line: 101, column: 20, scope: !163)
!167 = !DILocation(line: 102, column: 5, scope: !163)
!168 = !DILocation(line: 103, column: 12, scope: !156)
!169 = !DILocation(line: 103, column: 5, scope: !156)
