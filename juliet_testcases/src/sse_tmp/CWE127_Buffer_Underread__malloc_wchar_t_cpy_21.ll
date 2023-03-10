; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_21.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_21.c"
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !41
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %1) #5, !dbg !46
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !47
  call void @printWLine(i32* %arraydecay4), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @badStatic, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.end3, !dbg !57

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !58, metadata !DIExpression()), !dbg !61
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !62
  %1 = bitcast i8* %call to i32*, !dbg !63
  store i32* %1, i32** %dataBuffer, align 8, !dbg !61
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %cmp = icmp eq i32* %2, null, !dbg !66
  br i1 %cmp, label %if.then1, label %if.end, !dbg !67

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !70
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !71
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !73
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !75
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !76
  br label %if.end3, !dbg !77

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !78
  ret i32* %6, !dbg !79
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_21_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_21_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_21_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* null, i32** %data, align 8, !dbg !107
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !108
  %0 = load i32*, i32** %data, align 8, !dbg !109
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !110
  store i32* %call, i32** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !115
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !116
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !119
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %1) #5, !dbg !121
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !122
  call void @printWLine(i32* %arraydecay4), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !125 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !128
  %tobool = icmp ne i32 %0, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !131
  br label %if.end3, !dbg !133

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !134, metadata !DIExpression()), !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !138
  %1 = bitcast i8* %call to i32*, !dbg !139
  store i32* %1, i32** %dataBuffer, align 8, !dbg !137
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !140
  %cmp = icmp eq i32* %2, null, !dbg !142
  br i1 %cmp, label %if.then1, label %if.end, !dbg !143

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !147
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  store i32* %5, i32** %data.addr, align 8, !dbg !151
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data.addr, align 8, !dbg !152
  ret i32* %6, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !155, metadata !DIExpression()), !dbg !156
  store i32* null, i32** %data, align 8, !dbg !157
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !158
  %0 = load i32*, i32** %data, align 8, !dbg !159
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !160
  store i32* %call, i32** %data, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !162, metadata !DIExpression()), !dbg !164
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !165
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !166
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !168
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !169
  %1 = load i32*, i32** %data, align 8, !dbg !170
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %1) #5, !dbg !171
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !172
  call void @printWLine(i32* %arraydecay4), !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !175 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !176, metadata !DIExpression()), !dbg !177
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !178
  %tobool = icmp ne i32 %0, 0, !dbg !178
  br i1 %tobool, label %if.then, label %if.end3, !dbg !180

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !181, metadata !DIExpression()), !dbg !184
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !185
  %1 = bitcast i8* %call to i32*, !dbg !186
  store i32* %1, i32** %dataBuffer, align 8, !dbg !184
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !187
  %cmp = icmp eq i32* %2, null, !dbg !189
  br i1 %cmp, label %if.then1, label %if.end, !dbg !190

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !191
  unreachable, !dbg !191

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !193
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !194
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !195
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !195
  store i32 0, i32* %arrayidx, align 4, !dbg !196
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !197
  store i32* %5, i32** %data.addr, align 8, !dbg !198
  br label %if.end3, !dbg !199

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !200
  ret i32* %6, !dbg !201
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_21.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 65, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 66, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_21_bad", scope: !15, file: !15, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 200)
!39 = !DILocation(line: 49, column: 17, scope: !35)
!40 = !DILocation(line: 50, column: 17, scope: !35)
!41 = !DILocation(line: 50, column: 9, scope: !35)
!42 = !DILocation(line: 51, column: 9, scope: !35)
!43 = !DILocation(line: 51, column: 23, scope: !35)
!44 = !DILocation(line: 53, column: 16, scope: !35)
!45 = !DILocation(line: 53, column: 22, scope: !35)
!46 = !DILocation(line: 53, column: 9, scope: !35)
!47 = !DILocation(line: 54, column: 20, scope: !35)
!48 = !DILocation(line: 54, column: 9, scope: !35)
!49 = !DILocation(line: 58, column: 1, scope: !24)
!50 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !51, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!7, !7}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !15, line: 26, type: !7)
!54 = !DILocation(line: 26, column: 38, scope: !50)
!55 = !DILocation(line: 28, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !15, line: 28, column: 8)
!57 = !DILocation(line: 28, column: 8, scope: !50)
!58 = !DILocalVariable(name: "dataBuffer", scope: !59, file: !15, line: 31, type: !7)
!59 = distinct !DILexicalBlock(scope: !60, file: !15, line: 30, column: 9)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 29, column: 5)
!61 = !DILocation(line: 31, column: 23, scope: !59)
!62 = !DILocation(line: 31, column: 47, scope: !59)
!63 = !DILocation(line: 31, column: 36, scope: !59)
!64 = !DILocation(line: 32, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !15, line: 32, column: 17)
!66 = !DILocation(line: 32, column: 28, scope: !65)
!67 = !DILocation(line: 32, column: 17, scope: !59)
!68 = !DILocation(line: 32, column: 38, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 32, column: 37)
!70 = !DILocation(line: 33, column: 21, scope: !59)
!71 = !DILocation(line: 33, column: 13, scope: !59)
!72 = !DILocation(line: 34, column: 13, scope: !59)
!73 = !DILocation(line: 34, column: 31, scope: !59)
!74 = !DILocation(line: 36, column: 20, scope: !59)
!75 = !DILocation(line: 36, column: 31, scope: !59)
!76 = !DILocation(line: 36, column: 18, scope: !59)
!77 = !DILocation(line: 38, column: 5, scope: !60)
!78 = !DILocation(line: 39, column: 12, scope: !50)
!79 = !DILocation(line: 39, column: 5, scope: !50)
!80 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_21_good", scope: !15, file: !15, line: 143, type: !25, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 145, column: 5, scope: !80)
!82 = !DILocation(line: 146, column: 5, scope: !80)
!83 = !DILocation(line: 147, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 159, type: !85, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!10, !10, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !15, line: 159, type: !10)
!91 = !DILocation(line: 159, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !15, line: 159, type: !87)
!93 = !DILocation(line: 159, column: 27, scope: !84)
!94 = !DILocation(line: 162, column: 22, scope: !84)
!95 = !DILocation(line: 162, column: 12, scope: !84)
!96 = !DILocation(line: 162, column: 5, scope: !84)
!97 = !DILocation(line: 164, column: 5, scope: !84)
!98 = !DILocation(line: 165, column: 5, scope: !84)
!99 = !DILocation(line: 166, column: 5, scope: !84)
!100 = !DILocation(line: 169, column: 5, scope: !84)
!101 = !DILocation(line: 170, column: 5, scope: !84)
!102 = !DILocation(line: 171, column: 5, scope: !84)
!103 = !DILocation(line: 173, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 90, type: !25, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 92, type: !7)
!106 = !DILocation(line: 92, column: 15, scope: !104)
!107 = !DILocation(line: 93, column: 10, scope: !104)
!108 = !DILocation(line: 94, column: 20, scope: !104)
!109 = !DILocation(line: 95, column: 27, scope: !104)
!110 = !DILocation(line: 95, column: 12, scope: !104)
!111 = !DILocation(line: 95, column: 10, scope: !104)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !15, line: 97, type: !36)
!113 = distinct !DILexicalBlock(scope: !104, file: !15, line: 96, column: 5)
!114 = !DILocation(line: 97, column: 17, scope: !113)
!115 = !DILocation(line: 98, column: 17, scope: !113)
!116 = !DILocation(line: 98, column: 9, scope: !113)
!117 = !DILocation(line: 99, column: 9, scope: !113)
!118 = !DILocation(line: 99, column: 23, scope: !113)
!119 = !DILocation(line: 101, column: 16, scope: !113)
!120 = !DILocation(line: 101, column: 22, scope: !113)
!121 = !DILocation(line: 101, column: 9, scope: !113)
!122 = !DILocation(line: 102, column: 20, scope: !113)
!123 = !DILocation(line: 102, column: 9, scope: !113)
!124 = !DILocation(line: 106, column: 1, scope: !104)
!125 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 69, type: !51, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", arg: 1, scope: !125, file: !15, line: 69, type: !7)
!127 = !DILocation(line: 69, column: 43, scope: !125)
!128 = !DILocation(line: 71, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 71, column: 8)
!130 = !DILocation(line: 71, column: 8, scope: !125)
!131 = !DILocation(line: 74, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !15, line: 72, column: 5)
!133 = !DILocation(line: 75, column: 5, scope: !132)
!134 = !DILocalVariable(name: "dataBuffer", scope: !135, file: !15, line: 79, type: !7)
!135 = distinct !DILexicalBlock(scope: !136, file: !15, line: 78, column: 9)
!136 = distinct !DILexicalBlock(scope: !129, file: !15, line: 77, column: 5)
!137 = !DILocation(line: 79, column: 23, scope: !135)
!138 = !DILocation(line: 79, column: 47, scope: !135)
!139 = !DILocation(line: 79, column: 36, scope: !135)
!140 = !DILocation(line: 80, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !15, line: 80, column: 17)
!142 = !DILocation(line: 80, column: 28, scope: !141)
!143 = !DILocation(line: 80, column: 17, scope: !135)
!144 = !DILocation(line: 80, column: 38, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !15, line: 80, column: 37)
!146 = !DILocation(line: 81, column: 21, scope: !135)
!147 = !DILocation(line: 81, column: 13, scope: !135)
!148 = !DILocation(line: 82, column: 13, scope: !135)
!149 = !DILocation(line: 82, column: 31, scope: !135)
!150 = !DILocation(line: 84, column: 20, scope: !135)
!151 = !DILocation(line: 84, column: 18, scope: !135)
!152 = !DILocation(line: 87, column: 12, scope: !125)
!153 = !DILocation(line: 87, column: 5, scope: !125)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 125, type: !25, scopeLine: 126, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocalVariable(name: "data", scope: !154, file: !15, line: 127, type: !7)
!156 = !DILocation(line: 127, column: 15, scope: !154)
!157 = !DILocation(line: 128, column: 10, scope: !154)
!158 = !DILocation(line: 129, column: 20, scope: !154)
!159 = !DILocation(line: 130, column: 27, scope: !154)
!160 = !DILocation(line: 130, column: 12, scope: !154)
!161 = !DILocation(line: 130, column: 10, scope: !154)
!162 = !DILocalVariable(name: "dest", scope: !163, file: !15, line: 132, type: !36)
!163 = distinct !DILexicalBlock(scope: !154, file: !15, line: 131, column: 5)
!164 = !DILocation(line: 132, column: 17, scope: !163)
!165 = !DILocation(line: 133, column: 17, scope: !163)
!166 = !DILocation(line: 133, column: 9, scope: !163)
!167 = !DILocation(line: 134, column: 9, scope: !163)
!168 = !DILocation(line: 134, column: 23, scope: !163)
!169 = !DILocation(line: 136, column: 16, scope: !163)
!170 = !DILocation(line: 136, column: 22, scope: !163)
!171 = !DILocation(line: 136, column: 9, scope: !163)
!172 = !DILocation(line: 137, column: 20, scope: !163)
!173 = !DILocation(line: 137, column: 9, scope: !163)
!174 = !DILocation(line: 141, column: 1, scope: !154)
!175 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 109, type: !51, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!176 = !DILocalVariable(name: "data", arg: 1, scope: !175, file: !15, line: 109, type: !7)
!177 = !DILocation(line: 109, column: 43, scope: !175)
!178 = !DILocation(line: 111, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 111, column: 8)
!180 = !DILocation(line: 111, column: 8, scope: !175)
!181 = !DILocalVariable(name: "dataBuffer", scope: !182, file: !15, line: 114, type: !7)
!182 = distinct !DILexicalBlock(scope: !183, file: !15, line: 113, column: 9)
!183 = distinct !DILexicalBlock(scope: !179, file: !15, line: 112, column: 5)
!184 = !DILocation(line: 114, column: 23, scope: !182)
!185 = !DILocation(line: 114, column: 47, scope: !182)
!186 = !DILocation(line: 114, column: 36, scope: !182)
!187 = !DILocation(line: 115, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !182, file: !15, line: 115, column: 17)
!189 = !DILocation(line: 115, column: 28, scope: !188)
!190 = !DILocation(line: 115, column: 17, scope: !182)
!191 = !DILocation(line: 115, column: 38, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !15, line: 115, column: 37)
!193 = !DILocation(line: 116, column: 21, scope: !182)
!194 = !DILocation(line: 116, column: 13, scope: !182)
!195 = !DILocation(line: 117, column: 13, scope: !182)
!196 = !DILocation(line: 117, column: 31, scope: !182)
!197 = !DILocation(line: 119, column: 20, scope: !182)
!198 = !DILocation(line: 119, column: 18, scope: !182)
!199 = !DILocation(line: 121, column: 5, scope: !183)
!200 = !DILocation(line: 122, column: 12, scope: !175)
!201 = !DILocation(line: 122, column: 5, scope: !175)
