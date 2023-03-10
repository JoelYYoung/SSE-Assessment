; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_21.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_21.c"
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_21_bad() #0 !dbg !23 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !43
  %2 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %3), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load i32, i32* @badStatic, align 4, !dbg !54
  %tobool = icmp ne i32 %0, 0, !dbg !54
  br i1 %tobool, label %if.then, label %if.end2, !dbg !56

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !57, metadata !DIExpression()), !dbg !60
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !61
  store i8* %call, i8** %dataBuffer, align 8, !dbg !60
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  %cmp = icmp eq i8* %1, null, !dbg !64
  br i1 %cmp, label %if.then1, label %if.end, !dbg !65

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !66
  unreachable, !dbg !66

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !69
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !70
  store i8 0, i8* %arrayidx, align 1, !dbg !71
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !72
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !73
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !74
  br label %if.end2, !dbg !75

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !76
  ret i8* %5, !dbg !77
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_21_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_21_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_21_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !106
  store i8* %call, i8** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %1 = load i8*, i8** %data, align 8, !dbg !114
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !116
  store i8 0, i8* %arrayidx2, align 1, !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !118
  call void @printLine(i8* %3), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !121 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !124
  %tobool = icmp ne i32 %0, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.else, !dbg !126

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !127
  br label %if.end2, !dbg !129

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !130, metadata !DIExpression()), !dbg !133
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !134
  store i8* %call, i8** %dataBuffer, align 8, !dbg !133
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !135
  %cmp = icmp eq i8* %1, null, !dbg !137
  br i1 %cmp, label %if.then1, label %if.end, !dbg !138

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !142
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !143
  store i8 0, i8* %arrayidx, align 1, !dbg !144
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !145
  store i8* %4, i8** %data.addr, align 8, !dbg !146
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data.addr, align 8, !dbg !147
  ret i8* %5, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i8* null, i8** %data, align 8, !dbg !152
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !153
  %0 = load i8*, i8** %data, align 8, !dbg !154
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !155
  store i8* %call, i8** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !157, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !160
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !161
  store i8 0, i8* %arrayidx, align 1, !dbg !162
  %1 = load i8*, i8** %data, align 8, !dbg !163
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !164
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !164
  %2 = load i8*, i8** %data, align 8, !dbg !165
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !165
  store i8 0, i8* %arrayidx2, align 1, !dbg !166
  %3 = load i8*, i8** %data, align 8, !dbg !167
  call void @printLine(i8* %3), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !170 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !171, metadata !DIExpression()), !dbg !172
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !173
  %tobool = icmp ne i32 %0, 0, !dbg !173
  br i1 %tobool, label %if.then, label %if.end2, !dbg !175

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !176, metadata !DIExpression()), !dbg !179
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !180
  store i8* %call, i8** %dataBuffer, align 8, !dbg !179
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !181
  %cmp = icmp eq i8* %1, null, !dbg !183
  br i1 %cmp, label %if.then1, label %if.end, !dbg !184

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !185
  unreachable, !dbg !185

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !187
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !188
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !189
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !189
  store i8 0, i8* %arrayidx, align 1, !dbg !190
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !191
  store i8* %4, i8** %data.addr, align 8, !dbg !192
  br label %if.end2, !dbg !193

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !194
  ret i8* %5, !dbg !195
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 67, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 68, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_21_bad", scope: !13, file: !13, line: 42, type: !24, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!43 = !DILocation(line: 53, column: 9, scope: !34)
!44 = !DILocation(line: 55, column: 9, scope: !34)
!45 = !DILocation(line: 55, column: 21, scope: !34)
!46 = !DILocation(line: 56, column: 19, scope: !34)
!47 = !DILocation(line: 56, column: 9, scope: !34)
!48 = !DILocation(line: 60, column: 1, scope: !23)
!49 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !50, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{!7, !7}
!52 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !13, line: 26, type: !7)
!53 = !DILocation(line: 26, column: 32, scope: !49)
!54 = !DILocation(line: 28, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !13, line: 28, column: 8)
!56 = !DILocation(line: 28, column: 8, scope: !49)
!57 = !DILocalVariable(name: "dataBuffer", scope: !58, file: !13, line: 31, type: !7)
!58 = distinct !DILexicalBlock(scope: !59, file: !13, line: 30, column: 9)
!59 = distinct !DILexicalBlock(scope: !55, file: !13, line: 29, column: 5)
!60 = !DILocation(line: 31, column: 20, scope: !58)
!61 = !DILocation(line: 31, column: 41, scope: !58)
!62 = !DILocation(line: 32, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !13, line: 32, column: 17)
!64 = !DILocation(line: 32, column: 28, scope: !63)
!65 = !DILocation(line: 32, column: 17, scope: !58)
!66 = !DILocation(line: 32, column: 38, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !13, line: 32, column: 37)
!68 = !DILocation(line: 33, column: 20, scope: !58)
!69 = !DILocation(line: 33, column: 13, scope: !58)
!70 = !DILocation(line: 34, column: 13, scope: !58)
!71 = !DILocation(line: 34, column: 31, scope: !58)
!72 = !DILocation(line: 36, column: 20, scope: !58)
!73 = !DILocation(line: 36, column: 31, scope: !58)
!74 = !DILocation(line: 36, column: 18, scope: !58)
!75 = !DILocation(line: 38, column: 5, scope: !59)
!76 = !DILocation(line: 39, column: 12, scope: !49)
!77 = !DILocation(line: 39, column: 5, scope: !49)
!78 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_21_good", scope: !13, file: !13, line: 149, type: !24, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 151, column: 5, scope: !78)
!80 = !DILocation(line: 152, column: 5, scope: !78)
!81 = !DILocation(line: 153, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 165, type: !83, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!14, !14, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !13, line: 165, type: !14)
!87 = !DILocation(line: 165, column: 14, scope: !82)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !13, line: 165, type: !85)
!89 = !DILocation(line: 165, column: 27, scope: !82)
!90 = !DILocation(line: 168, column: 22, scope: !82)
!91 = !DILocation(line: 168, column: 12, scope: !82)
!92 = !DILocation(line: 168, column: 5, scope: !82)
!93 = !DILocation(line: 170, column: 5, scope: !82)
!94 = !DILocation(line: 171, column: 5, scope: !82)
!95 = !DILocation(line: 172, column: 5, scope: !82)
!96 = !DILocation(line: 175, column: 5, scope: !82)
!97 = !DILocation(line: 176, column: 5, scope: !82)
!98 = !DILocation(line: 177, column: 5, scope: !82)
!99 = !DILocation(line: 179, column: 5, scope: !82)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 92, type: !24, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !13, line: 94, type: !7)
!102 = !DILocation(line: 94, column: 12, scope: !100)
!103 = !DILocation(line: 95, column: 10, scope: !100)
!104 = !DILocation(line: 96, column: 20, scope: !100)
!105 = !DILocation(line: 97, column: 27, scope: !100)
!106 = !DILocation(line: 97, column: 12, scope: !100)
!107 = !DILocation(line: 97, column: 10, scope: !100)
!108 = !DILocalVariable(name: "source", scope: !109, file: !13, line: 99, type: !35)
!109 = distinct !DILexicalBlock(scope: !100, file: !13, line: 98, column: 5)
!110 = !DILocation(line: 99, column: 14, scope: !109)
!111 = !DILocation(line: 100, column: 9, scope: !109)
!112 = !DILocation(line: 101, column: 9, scope: !109)
!113 = !DILocation(line: 101, column: 23, scope: !109)
!114 = !DILocation(line: 103, column: 17, scope: !109)
!115 = !DILocation(line: 103, column: 9, scope: !109)
!116 = !DILocation(line: 105, column: 9, scope: !109)
!117 = !DILocation(line: 105, column: 21, scope: !109)
!118 = !DILocation(line: 106, column: 19, scope: !109)
!119 = !DILocation(line: 106, column: 9, scope: !109)
!120 = !DILocation(line: 110, column: 1, scope: !100)
!121 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 71, type: !50, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", arg: 1, scope: !121, file: !13, line: 71, type: !7)
!123 = !DILocation(line: 71, column: 37, scope: !121)
!124 = !DILocation(line: 73, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !13, line: 73, column: 8)
!126 = !DILocation(line: 73, column: 8, scope: !121)
!127 = !DILocation(line: 76, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !13, line: 74, column: 5)
!129 = !DILocation(line: 77, column: 5, scope: !128)
!130 = !DILocalVariable(name: "dataBuffer", scope: !131, file: !13, line: 81, type: !7)
!131 = distinct !DILexicalBlock(scope: !132, file: !13, line: 80, column: 9)
!132 = distinct !DILexicalBlock(scope: !125, file: !13, line: 79, column: 5)
!133 = !DILocation(line: 81, column: 20, scope: !131)
!134 = !DILocation(line: 81, column: 41, scope: !131)
!135 = !DILocation(line: 82, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !13, line: 82, column: 17)
!137 = !DILocation(line: 82, column: 28, scope: !136)
!138 = !DILocation(line: 82, column: 17, scope: !131)
!139 = !DILocation(line: 82, column: 38, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !13, line: 82, column: 37)
!141 = !DILocation(line: 83, column: 20, scope: !131)
!142 = !DILocation(line: 83, column: 13, scope: !131)
!143 = !DILocation(line: 84, column: 13, scope: !131)
!144 = !DILocation(line: 84, column: 31, scope: !131)
!145 = !DILocation(line: 86, column: 20, scope: !131)
!146 = !DILocation(line: 86, column: 18, scope: !131)
!147 = !DILocation(line: 89, column: 12, scope: !121)
!148 = !DILocation(line: 89, column: 5, scope: !121)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 129, type: !24, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "data", scope: !149, file: !13, line: 131, type: !7)
!151 = !DILocation(line: 131, column: 12, scope: !149)
!152 = !DILocation(line: 132, column: 10, scope: !149)
!153 = !DILocation(line: 133, column: 20, scope: !149)
!154 = !DILocation(line: 134, column: 27, scope: !149)
!155 = !DILocation(line: 134, column: 12, scope: !149)
!156 = !DILocation(line: 134, column: 10, scope: !149)
!157 = !DILocalVariable(name: "source", scope: !158, file: !13, line: 136, type: !35)
!158 = distinct !DILexicalBlock(scope: !149, file: !13, line: 135, column: 5)
!159 = !DILocation(line: 136, column: 14, scope: !158)
!160 = !DILocation(line: 137, column: 9, scope: !158)
!161 = !DILocation(line: 138, column: 9, scope: !158)
!162 = !DILocation(line: 138, column: 23, scope: !158)
!163 = !DILocation(line: 140, column: 17, scope: !158)
!164 = !DILocation(line: 140, column: 9, scope: !158)
!165 = !DILocation(line: 142, column: 9, scope: !158)
!166 = !DILocation(line: 142, column: 21, scope: !158)
!167 = !DILocation(line: 143, column: 19, scope: !158)
!168 = !DILocation(line: 143, column: 9, scope: !158)
!169 = !DILocation(line: 147, column: 1, scope: !149)
!170 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 113, type: !50, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "data", arg: 1, scope: !170, file: !13, line: 113, type: !7)
!172 = !DILocation(line: 113, column: 37, scope: !170)
!173 = !DILocation(line: 115, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !13, line: 115, column: 8)
!175 = !DILocation(line: 115, column: 8, scope: !170)
!176 = !DILocalVariable(name: "dataBuffer", scope: !177, file: !13, line: 118, type: !7)
!177 = distinct !DILexicalBlock(scope: !178, file: !13, line: 117, column: 9)
!178 = distinct !DILexicalBlock(scope: !174, file: !13, line: 116, column: 5)
!179 = !DILocation(line: 118, column: 20, scope: !177)
!180 = !DILocation(line: 118, column: 41, scope: !177)
!181 = !DILocation(line: 119, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !13, line: 119, column: 17)
!183 = !DILocation(line: 119, column: 28, scope: !182)
!184 = !DILocation(line: 119, column: 17, scope: !177)
!185 = !DILocation(line: 119, column: 38, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !13, line: 119, column: 37)
!187 = !DILocation(line: 120, column: 20, scope: !177)
!188 = !DILocation(line: 120, column: 13, scope: !177)
!189 = !DILocation(line: 121, column: 13, scope: !177)
!190 = !DILocation(line: 121, column: 31, scope: !177)
!191 = !DILocation(line: 123, column: 20, scope: !177)
!192 = !DILocation(line: 123, column: 18, scope: !177)
!193 = !DILocation(line: 125, column: 5, scope: !178)
!194 = !DILocation(line: 126, column: 12, scope: !170)
!195 = !DILocation(line: 126, column: 5, scope: !170)
