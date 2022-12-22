; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %call = call i32 @staticReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !47, metadata !DIExpression()), !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !50
  store i64 %call2, i64* %dataLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !55
  %5 = load i64, i64* %dataLen, align 8, !dbg !57
  %cmp = icmp ult i64 %4, %5, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !60
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !60
  %9 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !64
  store i32 %8, i32* %arrayidx4, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %10, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !72
  store i32 0, i32* %arrayidx5, align 4, !dbg !73
  %11 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %11), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_good() #0 !dbg !77 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !101 {
entry:
  ret i32 1, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay, i32** %data, align 8, !dbg !111
  %call = call i32 @staticReturnsFalse(), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !118
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !128, metadata !DIExpression()), !dbg !129
  %3 = load i32*, i32** %data, align 8, !dbg !130
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !131
  store i64 %call2, i64* %dataLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !136
  %5 = load i64, i64* %dataLen, align 8, !dbg !138
  %cmp = icmp ult i64 %4, %5, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !141
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !141
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !141
  %9 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !145
  store i32 %8, i32* %arrayidx4, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %10, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !152
  store i32 0, i32* %arrayidx5, align 4, !dbg !153
  %11 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %11), !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !157 {
entry:
  ret i32 0, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !159 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !164
  store i32* %arraydecay, i32** %data, align 8, !dbg !165
  %call = call i32 @staticReturnsTrue(), !dbg !166
  %tobool = icmp ne i32 %call, 0, !dbg !166
  br i1 %tobool, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !169
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !171
  %1 = load i32*, i32** %data, align 8, !dbg !172
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !172
  store i32 0, i32* %arrayidx, align 4, !dbg !173
  br label %if.end, !dbg !174

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !175, metadata !DIExpression()), !dbg !177
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !180, metadata !DIExpression()), !dbg !181
  %3 = load i32*, i32** %data, align 8, !dbg !182
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !183
  store i64 %call2, i64* %dataLen, align 8, !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !188
  %5 = load i64, i64* %dataLen, align 8, !dbg !190
  %cmp = icmp ult i64 %4, %5, !dbg !191
  br i1 %cmp, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !193
  %7 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !193
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !193
  %9 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !197
  store i32 %8, i32* %arrayidx4, align 4, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %10, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !204
  store i32 0, i32* %arrayidx5, align 4, !dbg !205
  %11 = load i32*, i32** %data, align 8, !dbg !206
  call void @printWLine(i32* %11), !dbg !207
  ret void, !dbg !208
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocation(line: 41, column: 12, scope: !11)
!27 = !DILocation(line: 41, column: 10, scope: !11)
!28 = !DILocation(line: 42, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!30 = !DILocation(line: 42, column: 8, scope: !11)
!31 = !DILocation(line: 45, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !12, line: 43, column: 5)
!33 = !DILocation(line: 45, column: 9, scope: !32)
!34 = !DILocation(line: 46, column: 9, scope: !32)
!35 = !DILocation(line: 46, column: 21, scope: !32)
!36 = !DILocation(line: 47, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 49, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 50, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 50, column: 16, scope: !38)
!47 = !DILocalVariable(name: "dataLen", scope: !38, file: !12, line: 50, type: !44)
!48 = !DILocation(line: 50, column: 19, scope: !38)
!49 = !DILocation(line: 51, column: 26, scope: !38)
!50 = !DILocation(line: 51, column: 19, scope: !38)
!51 = !DILocation(line: 51, column: 17, scope: !38)
!52 = !DILocation(line: 53, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !12, line: 53, column: 9)
!54 = !DILocation(line: 53, column: 14, scope: !53)
!55 = !DILocation(line: 53, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 53, column: 9)
!57 = !DILocation(line: 53, column: 25, scope: !56)
!58 = !DILocation(line: 53, column: 23, scope: !56)
!59 = !DILocation(line: 53, column: 9, scope: !53)
!60 = !DILocation(line: 55, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !12, line: 54, column: 9)
!62 = !DILocation(line: 55, column: 28, scope: !61)
!63 = !DILocation(line: 55, column: 18, scope: !61)
!64 = !DILocation(line: 55, column: 13, scope: !61)
!65 = !DILocation(line: 55, column: 21, scope: !61)
!66 = !DILocation(line: 56, column: 9, scope: !61)
!67 = !DILocation(line: 53, column: 35, scope: !56)
!68 = !DILocation(line: 53, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 56, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 57, column: 9, scope: !38)
!73 = !DILocation(line: 57, column: 20, scope: !38)
!74 = !DILocation(line: 58, column: 20, scope: !38)
!75 = !DILocation(line: 58, column: 9, scope: !38)
!76 = !DILocation(line: 60, column: 1, scope: !11)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_good", scope: !12, file: !12, line: 123, type: !13, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 125, column: 5, scope: !77)
!79 = !DILocation(line: 126, column: 5, scope: !77)
!80 = !DILocation(line: 127, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 139, type: !82, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!19, !19, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 139, type: !19)
!88 = !DILocation(line: 139, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 139, type: !84)
!90 = !DILocation(line: 139, column: 27, scope: !81)
!91 = !DILocation(line: 142, column: 22, scope: !81)
!92 = !DILocation(line: 142, column: 12, scope: !81)
!93 = !DILocation(line: 142, column: 5, scope: !81)
!94 = !DILocation(line: 144, column: 5, scope: !81)
!95 = !DILocation(line: 145, column: 5, scope: !81)
!96 = !DILocation(line: 146, column: 5, scope: !81)
!97 = !DILocation(line: 149, column: 5, scope: !81)
!98 = !DILocation(line: 150, column: 5, scope: !81)
!99 = !DILocation(line: 151, column: 5, scope: !81)
!100 = !DILocation(line: 153, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !102, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!19}
!104 = !DILocation(line: 27, column: 5, scope: !101)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 69, type: !16)
!107 = !DILocation(line: 69, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !12, line: 70, type: !22)
!109 = !DILocation(line: 70, column: 13, scope: !105)
!110 = !DILocation(line: 71, column: 12, scope: !105)
!111 = !DILocation(line: 71, column: 10, scope: !105)
!112 = !DILocation(line: 72, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !12, line: 72, column: 8)
!114 = !DILocation(line: 72, column: 8, scope: !105)
!115 = !DILocation(line: 75, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 73, column: 5)
!117 = !DILocation(line: 76, column: 5, scope: !116)
!118 = !DILocation(line: 80, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !12, line: 78, column: 5)
!120 = !DILocation(line: 80, column: 9, scope: !119)
!121 = !DILocation(line: 81, column: 9, scope: !119)
!122 = !DILocation(line: 81, column: 20, scope: !119)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !12, line: 84, type: !39)
!124 = distinct !DILexicalBlock(scope: !105, file: !12, line: 83, column: 5)
!125 = !DILocation(line: 84, column: 17, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 85, type: !44)
!127 = !DILocation(line: 85, column: 16, scope: !124)
!128 = !DILocalVariable(name: "dataLen", scope: !124, file: !12, line: 85, type: !44)
!129 = !DILocation(line: 85, column: 19, scope: !124)
!130 = !DILocation(line: 86, column: 26, scope: !124)
!131 = !DILocation(line: 86, column: 19, scope: !124)
!132 = !DILocation(line: 86, column: 17, scope: !124)
!133 = !DILocation(line: 88, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !12, line: 88, column: 9)
!135 = !DILocation(line: 88, column: 14, scope: !134)
!136 = !DILocation(line: 88, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 88, column: 9)
!138 = !DILocation(line: 88, column: 25, scope: !137)
!139 = !DILocation(line: 88, column: 23, scope: !137)
!140 = !DILocation(line: 88, column: 9, scope: !134)
!141 = !DILocation(line: 90, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !12, line: 89, column: 9)
!143 = !DILocation(line: 90, column: 28, scope: !142)
!144 = !DILocation(line: 90, column: 18, scope: !142)
!145 = !DILocation(line: 90, column: 13, scope: !142)
!146 = !DILocation(line: 90, column: 21, scope: !142)
!147 = !DILocation(line: 91, column: 9, scope: !142)
!148 = !DILocation(line: 88, column: 35, scope: !137)
!149 = !DILocation(line: 88, column: 9, scope: !137)
!150 = distinct !{!150, !140, !151, !71}
!151 = !DILocation(line: 91, column: 9, scope: !134)
!152 = !DILocation(line: 92, column: 9, scope: !124)
!153 = !DILocation(line: 92, column: 20, scope: !124)
!154 = !DILocation(line: 93, column: 20, scope: !124)
!155 = !DILocation(line: 93, column: 9, scope: !124)
!156 = !DILocation(line: 95, column: 1, scope: !105)
!157 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !102, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocation(line: 32, column: 5, scope: !157)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DILocalVariable(name: "data", scope: !159, file: !12, line: 100, type: !16)
!161 = !DILocation(line: 100, column: 15, scope: !159)
!162 = !DILocalVariable(name: "dataBuffer", scope: !159, file: !12, line: 101, type: !22)
!163 = !DILocation(line: 101, column: 13, scope: !159)
!164 = !DILocation(line: 102, column: 12, scope: !159)
!165 = !DILocation(line: 102, column: 10, scope: !159)
!166 = !DILocation(line: 103, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !159, file: !12, line: 103, column: 8)
!168 = !DILocation(line: 103, column: 8, scope: !159)
!169 = !DILocation(line: 106, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !12, line: 104, column: 5)
!171 = !DILocation(line: 106, column: 9, scope: !170)
!172 = !DILocation(line: 107, column: 9, scope: !170)
!173 = !DILocation(line: 107, column: 20, scope: !170)
!174 = !DILocation(line: 108, column: 5, scope: !170)
!175 = !DILocalVariable(name: "dest", scope: !176, file: !12, line: 110, type: !39)
!176 = distinct !DILexicalBlock(scope: !159, file: !12, line: 109, column: 5)
!177 = !DILocation(line: 110, column: 17, scope: !176)
!178 = !DILocalVariable(name: "i", scope: !176, file: !12, line: 111, type: !44)
!179 = !DILocation(line: 111, column: 16, scope: !176)
!180 = !DILocalVariable(name: "dataLen", scope: !176, file: !12, line: 111, type: !44)
!181 = !DILocation(line: 111, column: 19, scope: !176)
!182 = !DILocation(line: 112, column: 26, scope: !176)
!183 = !DILocation(line: 112, column: 19, scope: !176)
!184 = !DILocation(line: 112, column: 17, scope: !176)
!185 = !DILocation(line: 114, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !176, file: !12, line: 114, column: 9)
!187 = !DILocation(line: 114, column: 14, scope: !186)
!188 = !DILocation(line: 114, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !12, line: 114, column: 9)
!190 = !DILocation(line: 114, column: 25, scope: !189)
!191 = !DILocation(line: 114, column: 23, scope: !189)
!192 = !DILocation(line: 114, column: 9, scope: !186)
!193 = !DILocation(line: 116, column: 23, scope: !194)
!194 = distinct !DILexicalBlock(scope: !189, file: !12, line: 115, column: 9)
!195 = !DILocation(line: 116, column: 28, scope: !194)
!196 = !DILocation(line: 116, column: 18, scope: !194)
!197 = !DILocation(line: 116, column: 13, scope: !194)
!198 = !DILocation(line: 116, column: 21, scope: !194)
!199 = !DILocation(line: 117, column: 9, scope: !194)
!200 = !DILocation(line: 114, column: 35, scope: !189)
!201 = !DILocation(line: 114, column: 9, scope: !189)
!202 = distinct !{!202, !192, !203, !71}
!203 = !DILocation(line: 117, column: 9, scope: !186)
!204 = !DILocation(line: 118, column: 9, scope: !176)
!205 = !DILocation(line: 118, column: 20, scope: !176)
!206 = !DILocation(line: 119, column: 20, scope: !176)
!207 = !DILocation(line: 119, column: 9, scope: !176)
!208 = !DILocation(line: 121, column: 1, scope: !159)
