; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_21.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #6, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %3), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @badStatic, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.end2, !dbg !57

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !58, metadata !DIExpression()), !dbg !61
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !62
  store i8* %call, i8** %dataBuffer, align 8, !dbg !61
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  %cmp = icmp eq i8* %1, null, !dbg !65
  br i1 %cmp, label %if.then1, label %if.end, !dbg !66

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !67
  unreachable, !dbg !67

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !70
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !74
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !75
  br label %if.end2, !dbg !76

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !77
  ret i8* %5, !dbg !78
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_21_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_21_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_21_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i8* null, i8** %data, align 8, !dbg !104
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !105
  %0 = load i8*, i8** %data, align 8, !dbg !106
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  %1 = load i8*, i8** %data, align 8, !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #6, !dbg !117
  %2 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !118
  store i8 0, i8* %arrayidx3, align 1, !dbg !119
  %3 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %3), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !123 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !126
  %tobool = icmp ne i32 %0, 0, !dbg !126
  br i1 %tobool, label %if.then, label %if.else, !dbg !128

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !129
  br label %if.end2, !dbg !131

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !132, metadata !DIExpression()), !dbg !135
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !136
  store i8* %call, i8** %dataBuffer, align 8, !dbg !135
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !137
  %cmp = icmp eq i8* %1, null, !dbg !139
  br i1 %cmp, label %if.then1, label %if.end, !dbg !140

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !141
  unreachable, !dbg !141

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !144
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !145
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !147
  store i8* %4, i8** %data.addr, align 8, !dbg !148
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data.addr, align 8, !dbg !149
  ret i8* %5, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i8* null, i8** %data, align 8, !dbg !154
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !155
  %0 = load i8*, i8** %data, align 8, !dbg !156
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !157
  store i8* %call, i8** %data, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !159, metadata !DIExpression()), !dbg !161
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !162
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !163
  store i8 0, i8* %arrayidx, align 1, !dbg !164
  %1 = load i8*, i8** %data, align 8, !dbg !165
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !166
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #6, !dbg !167
  %2 = load i8*, i8** %data, align 8, !dbg !168
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !168
  store i8 0, i8* %arrayidx3, align 1, !dbg !169
  %3 = load i8*, i8** %data, align 8, !dbg !170
  call void @printLine(i8* %3), !dbg !171
  ret void, !dbg !172
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !173 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !174, metadata !DIExpression()), !dbg !175
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !176
  %tobool = icmp ne i32 %0, 0, !dbg !176
  br i1 %tobool, label %if.then, label %if.end2, !dbg !178

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !179, metadata !DIExpression()), !dbg !182
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !183
  store i8* %call, i8** %dataBuffer, align 8, !dbg !182
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !184
  %cmp = icmp eq i8* %1, null, !dbg !186
  br i1 %cmp, label %if.then1, label %if.end, !dbg !187

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !188
  unreachable, !dbg !188

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !191
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !192
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !192
  store i8 0, i8* %arrayidx, align 1, !dbg !193
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !194
  store i8* %4, i8** %data.addr, align 8, !dbg !195
  br label %if.end2, !dbg !196

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !197
  ret i8* %5, !dbg !198
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 67, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 68, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_21_bad", scope: !13, file: !13, line: 42, type: !24, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 44, type: !7)
!27 = !DILocation(line: 44, column: 12, scope: !23)
!28 = !DILocation(line: 45, column: 10, scope: !23)
!29 = !DILocation(line: 46, column: 15, scope: !23)
!30 = !DILocation(line: 47, column: 22, scope: !23)
!31 = !DILocation(line: 47, column: 12, scope: !23)
!32 = !DILocation(line: 47, column: 10, scope: !23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !13, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocation(line: 50, column: 9, scope: !34)
!40 = !DILocation(line: 51, column: 9, scope: !34)
!41 = !DILocation(line: 51, column: 23, scope: !34)
!42 = !DILocation(line: 53, column: 17, scope: !34)
!43 = !DILocation(line: 53, column: 23, scope: !34)
!44 = !DILocation(line: 53, column: 9, scope: !34)
!45 = !DILocation(line: 55, column: 9, scope: !34)
!46 = !DILocation(line: 55, column: 21, scope: !34)
!47 = !DILocation(line: 56, column: 19, scope: !34)
!48 = !DILocation(line: 56, column: 9, scope: !34)
!49 = !DILocation(line: 60, column: 1, scope: !23)
!50 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !51, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!7, !7}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !13, line: 26, type: !7)
!54 = !DILocation(line: 26, column: 32, scope: !50)
!55 = !DILocation(line: 28, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !13, line: 28, column: 8)
!57 = !DILocation(line: 28, column: 8, scope: !50)
!58 = !DILocalVariable(name: "dataBuffer", scope: !59, file: !13, line: 31, type: !7)
!59 = distinct !DILexicalBlock(scope: !60, file: !13, line: 30, column: 9)
!60 = distinct !DILexicalBlock(scope: !56, file: !13, line: 29, column: 5)
!61 = !DILocation(line: 31, column: 20, scope: !59)
!62 = !DILocation(line: 31, column: 41, scope: !59)
!63 = !DILocation(line: 32, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !13, line: 32, column: 17)
!65 = !DILocation(line: 32, column: 28, scope: !64)
!66 = !DILocation(line: 32, column: 17, scope: !59)
!67 = !DILocation(line: 32, column: 38, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !13, line: 32, column: 37)
!69 = !DILocation(line: 33, column: 20, scope: !59)
!70 = !DILocation(line: 33, column: 13, scope: !59)
!71 = !DILocation(line: 34, column: 13, scope: !59)
!72 = !DILocation(line: 34, column: 31, scope: !59)
!73 = !DILocation(line: 36, column: 20, scope: !59)
!74 = !DILocation(line: 36, column: 31, scope: !59)
!75 = !DILocation(line: 36, column: 18, scope: !59)
!76 = !DILocation(line: 38, column: 5, scope: !60)
!77 = !DILocation(line: 39, column: 12, scope: !50)
!78 = !DILocation(line: 39, column: 5, scope: !50)
!79 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_21_good", scope: !13, file: !13, line: 149, type: !24, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 151, column: 5, scope: !79)
!81 = !DILocation(line: 152, column: 5, scope: !79)
!82 = !DILocation(line: 153, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 165, type: !84, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!14, !14, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !13, line: 165, type: !14)
!88 = !DILocation(line: 165, column: 14, scope: !83)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !13, line: 165, type: !86)
!90 = !DILocation(line: 165, column: 27, scope: !83)
!91 = !DILocation(line: 168, column: 22, scope: !83)
!92 = !DILocation(line: 168, column: 12, scope: !83)
!93 = !DILocation(line: 168, column: 5, scope: !83)
!94 = !DILocation(line: 170, column: 5, scope: !83)
!95 = !DILocation(line: 171, column: 5, scope: !83)
!96 = !DILocation(line: 172, column: 5, scope: !83)
!97 = !DILocation(line: 175, column: 5, scope: !83)
!98 = !DILocation(line: 176, column: 5, scope: !83)
!99 = !DILocation(line: 177, column: 5, scope: !83)
!100 = !DILocation(line: 179, column: 5, scope: !83)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 92, type: !24, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !13, line: 94, type: !7)
!103 = !DILocation(line: 94, column: 12, scope: !101)
!104 = !DILocation(line: 95, column: 10, scope: !101)
!105 = !DILocation(line: 96, column: 20, scope: !101)
!106 = !DILocation(line: 97, column: 27, scope: !101)
!107 = !DILocation(line: 97, column: 12, scope: !101)
!108 = !DILocation(line: 97, column: 10, scope: !101)
!109 = !DILocalVariable(name: "source", scope: !110, file: !13, line: 99, type: !35)
!110 = distinct !DILexicalBlock(scope: !101, file: !13, line: 98, column: 5)
!111 = !DILocation(line: 99, column: 14, scope: !110)
!112 = !DILocation(line: 100, column: 9, scope: !110)
!113 = !DILocation(line: 101, column: 9, scope: !110)
!114 = !DILocation(line: 101, column: 23, scope: !110)
!115 = !DILocation(line: 103, column: 17, scope: !110)
!116 = !DILocation(line: 103, column: 23, scope: !110)
!117 = !DILocation(line: 103, column: 9, scope: !110)
!118 = !DILocation(line: 105, column: 9, scope: !110)
!119 = !DILocation(line: 105, column: 21, scope: !110)
!120 = !DILocation(line: 106, column: 19, scope: !110)
!121 = !DILocation(line: 106, column: 9, scope: !110)
!122 = !DILocation(line: 110, column: 1, scope: !101)
!123 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 71, type: !51, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", arg: 1, scope: !123, file: !13, line: 71, type: !7)
!125 = !DILocation(line: 71, column: 37, scope: !123)
!126 = !DILocation(line: 73, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !13, line: 73, column: 8)
!128 = !DILocation(line: 73, column: 8, scope: !123)
!129 = !DILocation(line: 76, column: 9, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !13, line: 74, column: 5)
!131 = !DILocation(line: 77, column: 5, scope: !130)
!132 = !DILocalVariable(name: "dataBuffer", scope: !133, file: !13, line: 81, type: !7)
!133 = distinct !DILexicalBlock(scope: !134, file: !13, line: 80, column: 9)
!134 = distinct !DILexicalBlock(scope: !127, file: !13, line: 79, column: 5)
!135 = !DILocation(line: 81, column: 20, scope: !133)
!136 = !DILocation(line: 81, column: 41, scope: !133)
!137 = !DILocation(line: 82, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !13, line: 82, column: 17)
!139 = !DILocation(line: 82, column: 28, scope: !138)
!140 = !DILocation(line: 82, column: 17, scope: !133)
!141 = !DILocation(line: 82, column: 38, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !13, line: 82, column: 37)
!143 = !DILocation(line: 83, column: 20, scope: !133)
!144 = !DILocation(line: 83, column: 13, scope: !133)
!145 = !DILocation(line: 84, column: 13, scope: !133)
!146 = !DILocation(line: 84, column: 31, scope: !133)
!147 = !DILocation(line: 86, column: 20, scope: !133)
!148 = !DILocation(line: 86, column: 18, scope: !133)
!149 = !DILocation(line: 89, column: 12, scope: !123)
!150 = !DILocation(line: 89, column: 5, scope: !123)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 129, type: !24, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!152 = !DILocalVariable(name: "data", scope: !151, file: !13, line: 131, type: !7)
!153 = !DILocation(line: 131, column: 12, scope: !151)
!154 = !DILocation(line: 132, column: 10, scope: !151)
!155 = !DILocation(line: 133, column: 20, scope: !151)
!156 = !DILocation(line: 134, column: 27, scope: !151)
!157 = !DILocation(line: 134, column: 12, scope: !151)
!158 = !DILocation(line: 134, column: 10, scope: !151)
!159 = !DILocalVariable(name: "source", scope: !160, file: !13, line: 136, type: !35)
!160 = distinct !DILexicalBlock(scope: !151, file: !13, line: 135, column: 5)
!161 = !DILocation(line: 136, column: 14, scope: !160)
!162 = !DILocation(line: 137, column: 9, scope: !160)
!163 = !DILocation(line: 138, column: 9, scope: !160)
!164 = !DILocation(line: 138, column: 23, scope: !160)
!165 = !DILocation(line: 140, column: 17, scope: !160)
!166 = !DILocation(line: 140, column: 23, scope: !160)
!167 = !DILocation(line: 140, column: 9, scope: !160)
!168 = !DILocation(line: 142, column: 9, scope: !160)
!169 = !DILocation(line: 142, column: 21, scope: !160)
!170 = !DILocation(line: 143, column: 19, scope: !160)
!171 = !DILocation(line: 143, column: 9, scope: !160)
!172 = !DILocation(line: 147, column: 1, scope: !151)
!173 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 113, type: !51, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!174 = !DILocalVariable(name: "data", arg: 1, scope: !173, file: !13, line: 113, type: !7)
!175 = !DILocation(line: 113, column: 37, scope: !173)
!176 = !DILocation(line: 115, column: 8, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !13, line: 115, column: 8)
!178 = !DILocation(line: 115, column: 8, scope: !173)
!179 = !DILocalVariable(name: "dataBuffer", scope: !180, file: !13, line: 118, type: !7)
!180 = distinct !DILexicalBlock(scope: !181, file: !13, line: 117, column: 9)
!181 = distinct !DILexicalBlock(scope: !177, file: !13, line: 116, column: 5)
!182 = !DILocation(line: 118, column: 20, scope: !180)
!183 = !DILocation(line: 118, column: 41, scope: !180)
!184 = !DILocation(line: 119, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !13, line: 119, column: 17)
!186 = !DILocation(line: 119, column: 28, scope: !185)
!187 = !DILocation(line: 119, column: 17, scope: !180)
!188 = !DILocation(line: 119, column: 38, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !13, line: 119, column: 37)
!190 = !DILocation(line: 120, column: 20, scope: !180)
!191 = !DILocation(line: 120, column: 13, scope: !180)
!192 = !DILocation(line: 121, column: 13, scope: !180)
!193 = !DILocation(line: 121, column: 31, scope: !180)
!194 = !DILocation(line: 123, column: 20, scope: !180)
!195 = !DILocation(line: 123, column: 18, scope: !180)
!196 = !DILocation(line: 125, column: 5, scope: !181)
!197 = !DILocation(line: 126, column: 12, scope: !173)
!198 = !DILocation(line: 126, column: 5, scope: !173)
