; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_21.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_21.c"
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_21_bad() #0 !dbg !23 {
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
  %call2 = call i8* @strcpy(i8* %1, i8* %arraydecay1) #6, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %2), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* @badStatic, align 4, !dbg !53
  %tobool = icmp ne i32 %0, 0, !dbg !53
  br i1 %tobool, label %if.then, label %if.end2, !dbg !55

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !56, metadata !DIExpression()), !dbg !59
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !60
  store i8* %call, i8** %dataBuffer, align 8, !dbg !59
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !61
  %cmp = icmp eq i8* %1, null, !dbg !63
  br i1 %cmp, label %if.then1, label %if.end, !dbg !64

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !65
  unreachable, !dbg !65

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !68
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !72
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !73
  br label %if.end2, !dbg !74

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !75
  ret i8* %5, !dbg !76
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_21_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_21_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_21_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
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
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !105
  store i8* %call, i8** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !110
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %1 = load i8*, i8** %data, align 8, !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  %call2 = call i8* @strcpy(i8* %1, i8* %arraydecay1) #6, !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !116
  call void @printLine(i8* %2), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !119 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !122
  %tobool = icmp ne i32 %0, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.else, !dbg !124

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !125
  br label %if.end2, !dbg !127

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !128, metadata !DIExpression()), !dbg !131
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !132
  store i8* %call, i8** %dataBuffer, align 8, !dbg !131
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !133
  %cmp = icmp eq i8* %1, null, !dbg !135
  br i1 %cmp, label %if.then1, label %if.end, !dbg !136

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !137
  unreachable, !dbg !137

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !140
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !141
  store i8 0, i8* %arrayidx, align 1, !dbg !142
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !143
  store i8* %4, i8** %data.addr, align 8, !dbg !144
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data.addr, align 8, !dbg !145
  ret i8* %5, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i8* null, i8** %data, align 8, !dbg !150
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !151
  %0 = load i8*, i8** %data, align 8, !dbg !152
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !153
  store i8* %call, i8** %data, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !155, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !158
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !159
  store i8 0, i8* %arrayidx, align 1, !dbg !160
  %1 = load i8*, i8** %data, align 8, !dbg !161
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !162
  %call2 = call i8* @strcpy(i8* %1, i8* %arraydecay1) #6, !dbg !163
  %2 = load i8*, i8** %data, align 8, !dbg !164
  call void @printLine(i8* %2), !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !167 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !168, metadata !DIExpression()), !dbg !169
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !170
  %tobool = icmp ne i32 %0, 0, !dbg !170
  br i1 %tobool, label %if.then, label %if.end2, !dbg !172

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !173, metadata !DIExpression()), !dbg !176
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !177
  store i8* %call, i8** %dataBuffer, align 8, !dbg !176
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !178
  %cmp = icmp eq i8* %1, null, !dbg !180
  br i1 %cmp, label %if.then1, label %if.end, !dbg !181

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !182
  unreachable, !dbg !182

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !184
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !185
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !186
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !186
  store i8 0, i8* %arrayidx, align 1, !dbg !187
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !188
  store i8* %4, i8** %data.addr, align 8, !dbg !189
  br label %if.end2, !dbg !190

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !191
  ret i8* %5, !dbg !192
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 65, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 66, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_21_bad", scope: !13, file: !13, line: 42, type: !24, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!42 = !DILocation(line: 53, column: 16, scope: !34)
!43 = !DILocation(line: 53, column: 22, scope: !34)
!44 = !DILocation(line: 53, column: 9, scope: !34)
!45 = !DILocation(line: 54, column: 19, scope: !34)
!46 = !DILocation(line: 54, column: 9, scope: !34)
!47 = !DILocation(line: 58, column: 1, scope: !23)
!48 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !49, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!7, !7}
!51 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !13, line: 26, type: !7)
!52 = !DILocation(line: 26, column: 32, scope: !48)
!53 = !DILocation(line: 28, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !13, line: 28, column: 8)
!55 = !DILocation(line: 28, column: 8, scope: !48)
!56 = !DILocalVariable(name: "dataBuffer", scope: !57, file: !13, line: 31, type: !7)
!57 = distinct !DILexicalBlock(scope: !58, file: !13, line: 30, column: 9)
!58 = distinct !DILexicalBlock(scope: !54, file: !13, line: 29, column: 5)
!59 = !DILocation(line: 31, column: 20, scope: !57)
!60 = !DILocation(line: 31, column: 41, scope: !57)
!61 = !DILocation(line: 32, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !13, line: 32, column: 17)
!63 = !DILocation(line: 32, column: 28, scope: !62)
!64 = !DILocation(line: 32, column: 17, scope: !57)
!65 = !DILocation(line: 32, column: 38, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !13, line: 32, column: 37)
!67 = !DILocation(line: 33, column: 20, scope: !57)
!68 = !DILocation(line: 33, column: 13, scope: !57)
!69 = !DILocation(line: 34, column: 13, scope: !57)
!70 = !DILocation(line: 34, column: 31, scope: !57)
!71 = !DILocation(line: 36, column: 20, scope: !57)
!72 = !DILocation(line: 36, column: 31, scope: !57)
!73 = !DILocation(line: 36, column: 18, scope: !57)
!74 = !DILocation(line: 38, column: 5, scope: !58)
!75 = !DILocation(line: 39, column: 12, scope: !48)
!76 = !DILocation(line: 39, column: 5, scope: !48)
!77 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_21_good", scope: !13, file: !13, line: 143, type: !24, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 145, column: 5, scope: !77)
!79 = !DILocation(line: 146, column: 5, scope: !77)
!80 = !DILocation(line: 147, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 159, type: !82, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!14, !14, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !13, line: 159, type: !14)
!86 = !DILocation(line: 159, column: 14, scope: !81)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !13, line: 159, type: !84)
!88 = !DILocation(line: 159, column: 27, scope: !81)
!89 = !DILocation(line: 162, column: 22, scope: !81)
!90 = !DILocation(line: 162, column: 12, scope: !81)
!91 = !DILocation(line: 162, column: 5, scope: !81)
!92 = !DILocation(line: 164, column: 5, scope: !81)
!93 = !DILocation(line: 165, column: 5, scope: !81)
!94 = !DILocation(line: 166, column: 5, scope: !81)
!95 = !DILocation(line: 169, column: 5, scope: !81)
!96 = !DILocation(line: 170, column: 5, scope: !81)
!97 = !DILocation(line: 171, column: 5, scope: !81)
!98 = !DILocation(line: 173, column: 5, scope: !81)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 90, type: !24, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !13, line: 92, type: !7)
!101 = !DILocation(line: 92, column: 12, scope: !99)
!102 = !DILocation(line: 93, column: 10, scope: !99)
!103 = !DILocation(line: 94, column: 20, scope: !99)
!104 = !DILocation(line: 95, column: 27, scope: !99)
!105 = !DILocation(line: 95, column: 12, scope: !99)
!106 = !DILocation(line: 95, column: 10, scope: !99)
!107 = !DILocalVariable(name: "source", scope: !108, file: !13, line: 97, type: !35)
!108 = distinct !DILexicalBlock(scope: !99, file: !13, line: 96, column: 5)
!109 = !DILocation(line: 97, column: 14, scope: !108)
!110 = !DILocation(line: 98, column: 9, scope: !108)
!111 = !DILocation(line: 99, column: 9, scope: !108)
!112 = !DILocation(line: 99, column: 23, scope: !108)
!113 = !DILocation(line: 101, column: 16, scope: !108)
!114 = !DILocation(line: 101, column: 22, scope: !108)
!115 = !DILocation(line: 101, column: 9, scope: !108)
!116 = !DILocation(line: 102, column: 19, scope: !108)
!117 = !DILocation(line: 102, column: 9, scope: !108)
!118 = !DILocation(line: 106, column: 1, scope: !99)
!119 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 69, type: !49, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", arg: 1, scope: !119, file: !13, line: 69, type: !7)
!121 = !DILocation(line: 69, column: 37, scope: !119)
!122 = !DILocation(line: 71, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !13, line: 71, column: 8)
!124 = !DILocation(line: 71, column: 8, scope: !119)
!125 = !DILocation(line: 74, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !13, line: 72, column: 5)
!127 = !DILocation(line: 75, column: 5, scope: !126)
!128 = !DILocalVariable(name: "dataBuffer", scope: !129, file: !13, line: 79, type: !7)
!129 = distinct !DILexicalBlock(scope: !130, file: !13, line: 78, column: 9)
!130 = distinct !DILexicalBlock(scope: !123, file: !13, line: 77, column: 5)
!131 = !DILocation(line: 79, column: 20, scope: !129)
!132 = !DILocation(line: 79, column: 41, scope: !129)
!133 = !DILocation(line: 80, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !13, line: 80, column: 17)
!135 = !DILocation(line: 80, column: 28, scope: !134)
!136 = !DILocation(line: 80, column: 17, scope: !129)
!137 = !DILocation(line: 80, column: 38, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !13, line: 80, column: 37)
!139 = !DILocation(line: 81, column: 20, scope: !129)
!140 = !DILocation(line: 81, column: 13, scope: !129)
!141 = !DILocation(line: 82, column: 13, scope: !129)
!142 = !DILocation(line: 82, column: 31, scope: !129)
!143 = !DILocation(line: 84, column: 20, scope: !129)
!144 = !DILocation(line: 84, column: 18, scope: !129)
!145 = !DILocation(line: 87, column: 12, scope: !119)
!146 = !DILocation(line: 87, column: 5, scope: !119)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 125, type: !24, scopeLine: 126, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", scope: !147, file: !13, line: 127, type: !7)
!149 = !DILocation(line: 127, column: 12, scope: !147)
!150 = !DILocation(line: 128, column: 10, scope: !147)
!151 = !DILocation(line: 129, column: 20, scope: !147)
!152 = !DILocation(line: 130, column: 27, scope: !147)
!153 = !DILocation(line: 130, column: 12, scope: !147)
!154 = !DILocation(line: 130, column: 10, scope: !147)
!155 = !DILocalVariable(name: "source", scope: !156, file: !13, line: 132, type: !35)
!156 = distinct !DILexicalBlock(scope: !147, file: !13, line: 131, column: 5)
!157 = !DILocation(line: 132, column: 14, scope: !156)
!158 = !DILocation(line: 133, column: 9, scope: !156)
!159 = !DILocation(line: 134, column: 9, scope: !156)
!160 = !DILocation(line: 134, column: 23, scope: !156)
!161 = !DILocation(line: 136, column: 16, scope: !156)
!162 = !DILocation(line: 136, column: 22, scope: !156)
!163 = !DILocation(line: 136, column: 9, scope: !156)
!164 = !DILocation(line: 137, column: 19, scope: !156)
!165 = !DILocation(line: 137, column: 9, scope: !156)
!166 = !DILocation(line: 141, column: 1, scope: !147)
!167 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 109, type: !49, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!168 = !DILocalVariable(name: "data", arg: 1, scope: !167, file: !13, line: 109, type: !7)
!169 = !DILocation(line: 109, column: 37, scope: !167)
!170 = !DILocation(line: 111, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !13, line: 111, column: 8)
!172 = !DILocation(line: 111, column: 8, scope: !167)
!173 = !DILocalVariable(name: "dataBuffer", scope: !174, file: !13, line: 114, type: !7)
!174 = distinct !DILexicalBlock(scope: !175, file: !13, line: 113, column: 9)
!175 = distinct !DILexicalBlock(scope: !171, file: !13, line: 112, column: 5)
!176 = !DILocation(line: 114, column: 20, scope: !174)
!177 = !DILocation(line: 114, column: 41, scope: !174)
!178 = !DILocation(line: 115, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !174, file: !13, line: 115, column: 17)
!180 = !DILocation(line: 115, column: 28, scope: !179)
!181 = !DILocation(line: 115, column: 17, scope: !174)
!182 = !DILocation(line: 115, column: 38, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !13, line: 115, column: 37)
!184 = !DILocation(line: 116, column: 20, scope: !174)
!185 = !DILocation(line: 116, column: 13, scope: !174)
!186 = !DILocation(line: 117, column: 13, scope: !174)
!187 = !DILocation(line: 117, column: 31, scope: !174)
!188 = !DILocation(line: 119, column: 20, scope: !174)
!189 = !DILocation(line: 119, column: 18, scope: !174)
!190 = !DILocation(line: 121, column: 5, scope: !175)
!191 = !DILocation(line: 122, column: 12, scope: !167)
!192 = !DILocation(line: 122, column: 5, scope: !167)
