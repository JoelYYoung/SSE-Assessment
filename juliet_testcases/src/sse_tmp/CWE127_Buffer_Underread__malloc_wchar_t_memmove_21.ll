; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_21.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !44
  %2 = load i32*, i32** %data, align 8, !dbg !45
  %3 = bitcast i32* %2 to i8*, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx3, align 4, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  call void @printWLine(i32* %arraydecay4), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32, i32* @badStatic, align 4, !dbg !56
  %tobool = icmp ne i32 %0, 0, !dbg !56
  br i1 %tobool, label %if.then, label %if.end3, !dbg !58

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !59, metadata !DIExpression()), !dbg !62
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !63
  %1 = bitcast i8* %call to i32*, !dbg !64
  store i32* %1, i32** %dataBuffer, align 8, !dbg !62
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %cmp = icmp eq i32* %2, null, !dbg !67
  br i1 %cmp, label %if.then1, label %if.end, !dbg !68

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !71
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !72
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !76
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !77
  br label %if.end3, !dbg !78

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !79
  ret i32* %6, !dbg !80
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_21_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_21_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_21_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %data, align 8, !dbg !108
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !109
  %0 = load i32*, i32** %data, align 8, !dbg !110
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !111
  store i32* %call, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !117
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %3 = bitcast i32* %2 to i8*, !dbg !120
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx3, align 4, !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  call void @printWLine(i32* %arraydecay4), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !127 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !130
  %tobool = icmp ne i32 %0, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.else, !dbg !132

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !133
  br label %if.end3, !dbg !135

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !136, metadata !DIExpression()), !dbg !139
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !140
  %1 = bitcast i8* %call to i32*, !dbg !141
  store i32* %1, i32** %dataBuffer, align 8, !dbg !139
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !142
  %cmp = icmp eq i32* %2, null, !dbg !144
  br i1 %cmp, label %if.then1, label %if.end, !dbg !145

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !149
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !152
  store i32* %5, i32** %data.addr, align 8, !dbg !153
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data.addr, align 8, !dbg !154
  ret i32* %6, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  store i32* null, i32** %data, align 8, !dbg !159
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !160
  %0 = load i32*, i32** %data, align 8, !dbg !161
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !162
  store i32* %call, i32** %data, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !164, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !168
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx, align 4, !dbg !170
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !171
  %2 = load i32*, i32** %data, align 8, !dbg !172
  %3 = bitcast i32* %2 to i8*, !dbg !171
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !171
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx3, align 4, !dbg !174
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  call void @printWLine(i32* %arraydecay4), !dbg !176
  ret void, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !178 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !179, metadata !DIExpression()), !dbg !180
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !181
  %tobool = icmp ne i32 %0, 0, !dbg !181
  br i1 %tobool, label %if.then, label %if.end3, !dbg !183

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !184, metadata !DIExpression()), !dbg !187
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !188
  %1 = bitcast i8* %call to i32*, !dbg !189
  store i32* %1, i32** %dataBuffer, align 8, !dbg !187
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !190
  %cmp = icmp eq i32* %2, null, !dbg !192
  br i1 %cmp, label %if.then1, label %if.end, !dbg !193

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !194
  unreachable, !dbg !194

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !196
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !197
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !198
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !198
  store i32 0, i32* %arrayidx, align 4, !dbg !199
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !200
  store i32* %5, i32** %data.addr, align 8, !dbg !201
  br label %if.end3, !dbg !202

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !203
  ret i32* %6, !dbg !204
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 67, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 68, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_21_bad", scope: !15, file: !15, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 44, type: !7)
!28 = !DILocation(line: 44, column: 15, scope: !24)
!29 = !DILocation(line: 45, column: 10, scope: !24)
!30 = !DILocation(line: 46, column: 15, scope: !24)
!31 = !DILocation(line: 47, column: 22, scope: !24)
!32 = !DILocation(line: 47, column: 12, scope: !24)
!33 = !DILocation(line: 47, column: 10, scope: !24)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 49, column: 17, scope: !35)
!40 = !DILocation(line: 50, column: 17, scope: !35)
!41 = !DILocation(line: 50, column: 9, scope: !35)
!42 = !DILocation(line: 51, column: 9, scope: !35)
!43 = !DILocation(line: 51, column: 21, scope: !35)
!44 = !DILocation(line: 53, column: 9, scope: !35)
!45 = !DILocation(line: 53, column: 23, scope: !35)
!46 = !DILocation(line: 55, column: 9, scope: !35)
!47 = !DILocation(line: 55, column: 21, scope: !35)
!48 = !DILocation(line: 56, column: 20, scope: !35)
!49 = !DILocation(line: 56, column: 9, scope: !35)
!50 = !DILocation(line: 60, column: 1, scope: !24)
!51 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !52, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!7, !7}
!54 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !15, line: 26, type: !7)
!55 = !DILocation(line: 26, column: 38, scope: !51)
!56 = !DILocation(line: 28, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !15, line: 28, column: 8)
!58 = !DILocation(line: 28, column: 8, scope: !51)
!59 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !15, line: 31, type: !7)
!60 = distinct !DILexicalBlock(scope: !61, file: !15, line: 30, column: 9)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 29, column: 5)
!62 = !DILocation(line: 31, column: 23, scope: !60)
!63 = !DILocation(line: 31, column: 47, scope: !60)
!64 = !DILocation(line: 31, column: 36, scope: !60)
!65 = !DILocation(line: 32, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !15, line: 32, column: 17)
!67 = !DILocation(line: 32, column: 28, scope: !66)
!68 = !DILocation(line: 32, column: 17, scope: !60)
!69 = !DILocation(line: 32, column: 38, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 32, column: 37)
!71 = !DILocation(line: 33, column: 21, scope: !60)
!72 = !DILocation(line: 33, column: 13, scope: !60)
!73 = !DILocation(line: 34, column: 13, scope: !60)
!74 = !DILocation(line: 34, column: 31, scope: !60)
!75 = !DILocation(line: 36, column: 20, scope: !60)
!76 = !DILocation(line: 36, column: 31, scope: !60)
!77 = !DILocation(line: 36, column: 18, scope: !60)
!78 = !DILocation(line: 38, column: 5, scope: !61)
!79 = !DILocation(line: 39, column: 12, scope: !51)
!80 = !DILocation(line: 39, column: 5, scope: !51)
!81 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_21_good", scope: !15, file: !15, line: 149, type: !25, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 151, column: 5, scope: !81)
!83 = !DILocation(line: 152, column: 5, scope: !81)
!84 = !DILocation(line: 153, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 165, type: !86, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!10, !10, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 165, type: !10)
!92 = !DILocation(line: 165, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 165, type: !88)
!94 = !DILocation(line: 165, column: 27, scope: !85)
!95 = !DILocation(line: 168, column: 22, scope: !85)
!96 = !DILocation(line: 168, column: 12, scope: !85)
!97 = !DILocation(line: 168, column: 5, scope: !85)
!98 = !DILocation(line: 170, column: 5, scope: !85)
!99 = !DILocation(line: 171, column: 5, scope: !85)
!100 = !DILocation(line: 172, column: 5, scope: !85)
!101 = !DILocation(line: 175, column: 5, scope: !85)
!102 = !DILocation(line: 176, column: 5, scope: !85)
!103 = !DILocation(line: 177, column: 5, scope: !85)
!104 = !DILocation(line: 179, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 92, type: !25, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 94, type: !7)
!107 = !DILocation(line: 94, column: 15, scope: !105)
!108 = !DILocation(line: 95, column: 10, scope: !105)
!109 = !DILocation(line: 96, column: 20, scope: !105)
!110 = !DILocation(line: 97, column: 27, scope: !105)
!111 = !DILocation(line: 97, column: 12, scope: !105)
!112 = !DILocation(line: 97, column: 10, scope: !105)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !15, line: 99, type: !36)
!114 = distinct !DILexicalBlock(scope: !105, file: !15, line: 98, column: 5)
!115 = !DILocation(line: 99, column: 17, scope: !114)
!116 = !DILocation(line: 100, column: 17, scope: !114)
!117 = !DILocation(line: 100, column: 9, scope: !114)
!118 = !DILocation(line: 101, column: 9, scope: !114)
!119 = !DILocation(line: 101, column: 21, scope: !114)
!120 = !DILocation(line: 103, column: 9, scope: !114)
!121 = !DILocation(line: 103, column: 23, scope: !114)
!122 = !DILocation(line: 105, column: 9, scope: !114)
!123 = !DILocation(line: 105, column: 21, scope: !114)
!124 = !DILocation(line: 106, column: 20, scope: !114)
!125 = !DILocation(line: 106, column: 9, scope: !114)
!126 = !DILocation(line: 110, column: 1, scope: !105)
!127 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 71, type: !52, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", arg: 1, scope: !127, file: !15, line: 71, type: !7)
!129 = !DILocation(line: 71, column: 43, scope: !127)
!130 = !DILocation(line: 73, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 73, column: 8)
!132 = !DILocation(line: 73, column: 8, scope: !127)
!133 = !DILocation(line: 76, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !15, line: 74, column: 5)
!135 = !DILocation(line: 77, column: 5, scope: !134)
!136 = !DILocalVariable(name: "dataBuffer", scope: !137, file: !15, line: 81, type: !7)
!137 = distinct !DILexicalBlock(scope: !138, file: !15, line: 80, column: 9)
!138 = distinct !DILexicalBlock(scope: !131, file: !15, line: 79, column: 5)
!139 = !DILocation(line: 81, column: 23, scope: !137)
!140 = !DILocation(line: 81, column: 47, scope: !137)
!141 = !DILocation(line: 81, column: 36, scope: !137)
!142 = !DILocation(line: 82, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !15, line: 82, column: 17)
!144 = !DILocation(line: 82, column: 28, scope: !143)
!145 = !DILocation(line: 82, column: 17, scope: !137)
!146 = !DILocation(line: 82, column: 38, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 82, column: 37)
!148 = !DILocation(line: 83, column: 21, scope: !137)
!149 = !DILocation(line: 83, column: 13, scope: !137)
!150 = !DILocation(line: 84, column: 13, scope: !137)
!151 = !DILocation(line: 84, column: 31, scope: !137)
!152 = !DILocation(line: 86, column: 20, scope: !137)
!153 = !DILocation(line: 86, column: 18, scope: !137)
!154 = !DILocation(line: 89, column: 12, scope: !127)
!155 = !DILocation(line: 89, column: 5, scope: !127)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 129, type: !25, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", scope: !156, file: !15, line: 131, type: !7)
!158 = !DILocation(line: 131, column: 15, scope: !156)
!159 = !DILocation(line: 132, column: 10, scope: !156)
!160 = !DILocation(line: 133, column: 20, scope: !156)
!161 = !DILocation(line: 134, column: 27, scope: !156)
!162 = !DILocation(line: 134, column: 12, scope: !156)
!163 = !DILocation(line: 134, column: 10, scope: !156)
!164 = !DILocalVariable(name: "dest", scope: !165, file: !15, line: 136, type: !36)
!165 = distinct !DILexicalBlock(scope: !156, file: !15, line: 135, column: 5)
!166 = !DILocation(line: 136, column: 17, scope: !165)
!167 = !DILocation(line: 137, column: 17, scope: !165)
!168 = !DILocation(line: 137, column: 9, scope: !165)
!169 = !DILocation(line: 138, column: 9, scope: !165)
!170 = !DILocation(line: 138, column: 21, scope: !165)
!171 = !DILocation(line: 140, column: 9, scope: !165)
!172 = !DILocation(line: 140, column: 23, scope: !165)
!173 = !DILocation(line: 142, column: 9, scope: !165)
!174 = !DILocation(line: 142, column: 21, scope: !165)
!175 = !DILocation(line: 143, column: 20, scope: !165)
!176 = !DILocation(line: 143, column: 9, scope: !165)
!177 = !DILocation(line: 147, column: 1, scope: !156)
!178 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 113, type: !52, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!179 = !DILocalVariable(name: "data", arg: 1, scope: !178, file: !15, line: 113, type: !7)
!180 = !DILocation(line: 113, column: 43, scope: !178)
!181 = !DILocation(line: 115, column: 8, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 115, column: 8)
!183 = !DILocation(line: 115, column: 8, scope: !178)
!184 = !DILocalVariable(name: "dataBuffer", scope: !185, file: !15, line: 118, type: !7)
!185 = distinct !DILexicalBlock(scope: !186, file: !15, line: 117, column: 9)
!186 = distinct !DILexicalBlock(scope: !182, file: !15, line: 116, column: 5)
!187 = !DILocation(line: 118, column: 23, scope: !185)
!188 = !DILocation(line: 118, column: 47, scope: !185)
!189 = !DILocation(line: 118, column: 36, scope: !185)
!190 = !DILocation(line: 119, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !15, line: 119, column: 17)
!192 = !DILocation(line: 119, column: 28, scope: !191)
!193 = !DILocation(line: 119, column: 17, scope: !185)
!194 = !DILocation(line: 119, column: 38, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !15, line: 119, column: 37)
!196 = !DILocation(line: 120, column: 21, scope: !185)
!197 = !DILocation(line: 120, column: 13, scope: !185)
!198 = !DILocation(line: 121, column: 13, scope: !185)
!199 = !DILocation(line: 121, column: 31, scope: !185)
!200 = !DILocation(line: 123, column: 20, scope: !185)
!201 = !DILocation(line: 123, column: 18, scope: !185)
!202 = !DILocation(line: 125, column: 5, scope: !186)
!203 = !DILocation(line: 126, column: 12, scope: !178)
!204 = !DILocation(line: 126, column: 5, scope: !178)
