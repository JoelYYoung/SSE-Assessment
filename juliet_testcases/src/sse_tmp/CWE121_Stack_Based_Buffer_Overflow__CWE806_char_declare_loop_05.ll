; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %0, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  %call = call i64 @strlen(i8* %4) #6, !dbg !55
  store i64 %call, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !60
  %6 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp = icmp ult i64 %5, %6, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !65
  %8 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !65
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !65
  %10 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !69
  store i8 %9, i8* %arrayidx2, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %11, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !77
  store i8 0, i8* %arrayidx3, align 1, !dbg !78
  %12 = load i8*, i8** %data, align 8, !dbg !79
  call void @printLine(i8* %12), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !109
  store i8* %arraydecay, i8** %data, align 8, !dbg !110
  %0 = load i32, i32* @staticFalse, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !128
  %4 = load i8*, i8** %data, align 8, !dbg !129
  %call = call i64 @strlen(i8* %4) #6, !dbg !130
  store i64 %call, i64* %dataLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !135
  %6 = load i64, i64* %dataLen, align 8, !dbg !137
  %cmp = icmp ult i64 %5, %6, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !140
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !140
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !140
  %10 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !144
  store i8 %9, i8* %arrayidx2, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %11, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !151
  store i8 0, i8* %arrayidx3, align 1, !dbg !152
  %12 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* %12), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !161
  store i8* %arraydecay, i8** %data, align 8, !dbg !162
  %0 = load i32, i32* @staticTrue, align 4, !dbg !163
  %tobool = icmp ne i32 %0, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !168
  %2 = load i8*, i8** %data, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !172, metadata !DIExpression()), !dbg !174
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !177, metadata !DIExpression()), !dbg !178
  %4 = load i8*, i8** %data, align 8, !dbg !179
  %call = call i64 @strlen(i8* %4) #6, !dbg !180
  store i64 %call, i64* %dataLen, align 8, !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !185
  %6 = load i64, i64* %dataLen, align 8, !dbg !187
  %cmp = icmp ult i64 %5, %6, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !190
  %8 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !190
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !190
  %10 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !194
  store i8 %9, i8* %arrayidx2, align 1, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %11, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !201
  store i8 0, i8* %arrayidx3, align 1, !dbg !202
  %12 = load i8*, i8** %data, align 8, !dbg !203
  call void @printLine(i8* %12), !dbg !204
  ret void, !dbg !205
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocation(line: 34, column: 12, scope: !18)
!31 = !DILocation(line: 34, column: 10, scope: !18)
!32 = !DILocation(line: 35, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!34 = !DILocation(line: 35, column: 8, scope: !18)
!35 = !DILocation(line: 38, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !10, line: 36, column: 5)
!37 = !DILocation(line: 38, column: 9, scope: !36)
!38 = !DILocation(line: 39, column: 9, scope: !36)
!39 = !DILocation(line: 39, column: 21, scope: !36)
!40 = !DILocation(line: 40, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !10, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 42, column: 14, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !10, line: 43, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 43, column: 16, scope: !42)
!52 = !DILocalVariable(name: "dataLen", scope: !42, file: !10, line: 43, type: !48)
!53 = !DILocation(line: 43, column: 19, scope: !42)
!54 = !DILocation(line: 44, column: 26, scope: !42)
!55 = !DILocation(line: 44, column: 19, scope: !42)
!56 = !DILocation(line: 44, column: 17, scope: !42)
!57 = !DILocation(line: 46, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !42, file: !10, line: 46, column: 9)
!59 = !DILocation(line: 46, column: 14, scope: !58)
!60 = !DILocation(line: 46, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !10, line: 46, column: 9)
!62 = !DILocation(line: 46, column: 25, scope: !61)
!63 = !DILocation(line: 46, column: 23, scope: !61)
!64 = !DILocation(line: 46, column: 9, scope: !58)
!65 = !DILocation(line: 48, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !10, line: 47, column: 9)
!67 = !DILocation(line: 48, column: 28, scope: !66)
!68 = !DILocation(line: 48, column: 18, scope: !66)
!69 = !DILocation(line: 48, column: 13, scope: !66)
!70 = !DILocation(line: 48, column: 21, scope: !66)
!71 = !DILocation(line: 49, column: 9, scope: !66)
!72 = !DILocation(line: 46, column: 35, scope: !61)
!73 = !DILocation(line: 46, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 49, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 50, column: 9, scope: !42)
!78 = !DILocation(line: 50, column: 20, scope: !42)
!79 = !DILocation(line: 51, column: 19, scope: !42)
!80 = !DILocation(line: 51, column: 9, scope: !42)
!81 = !DILocation(line: 53, column: 1, scope: !18)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_05_good", scope: !10, file: !10, line: 116, type: !19, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocation(line: 118, column: 5, scope: !82)
!84 = !DILocation(line: 119, column: 5, scope: !82)
!85 = !DILocation(line: 120, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 132, type: !87, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!11, !11, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !10, line: 132, type: !11)
!91 = !DILocation(line: 132, column: 14, scope: !86)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !10, line: 132, type: !89)
!93 = !DILocation(line: 132, column: 27, scope: !86)
!94 = !DILocation(line: 135, column: 22, scope: !86)
!95 = !DILocation(line: 135, column: 12, scope: !86)
!96 = !DILocation(line: 135, column: 5, scope: !86)
!97 = !DILocation(line: 137, column: 5, scope: !86)
!98 = !DILocation(line: 138, column: 5, scope: !86)
!99 = !DILocation(line: 139, column: 5, scope: !86)
!100 = !DILocation(line: 142, column: 5, scope: !86)
!101 = !DILocation(line: 143, column: 5, scope: !86)
!102 = !DILocation(line: 144, column: 5, scope: !86)
!103 = !DILocation(line: 146, column: 5, scope: !86)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !10, line: 62, type: !22)
!106 = !DILocation(line: 62, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !10, line: 63, type: !26)
!108 = !DILocation(line: 63, column: 10, scope: !104)
!109 = !DILocation(line: 64, column: 12, scope: !104)
!110 = !DILocation(line: 64, column: 10, scope: !104)
!111 = !DILocation(line: 65, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !10, line: 65, column: 8)
!113 = !DILocation(line: 65, column: 8, scope: !104)
!114 = !DILocation(line: 68, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !10, line: 66, column: 5)
!116 = !DILocation(line: 69, column: 5, scope: !115)
!117 = !DILocation(line: 73, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !10, line: 71, column: 5)
!119 = !DILocation(line: 73, column: 9, scope: !118)
!120 = !DILocation(line: 74, column: 9, scope: !118)
!121 = !DILocation(line: 74, column: 20, scope: !118)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !10, line: 77, type: !43)
!123 = distinct !DILexicalBlock(scope: !104, file: !10, line: 76, column: 5)
!124 = !DILocation(line: 77, column: 14, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !10, line: 78, type: !48)
!126 = !DILocation(line: 78, column: 16, scope: !123)
!127 = !DILocalVariable(name: "dataLen", scope: !123, file: !10, line: 78, type: !48)
!128 = !DILocation(line: 78, column: 19, scope: !123)
!129 = !DILocation(line: 79, column: 26, scope: !123)
!130 = !DILocation(line: 79, column: 19, scope: !123)
!131 = !DILocation(line: 79, column: 17, scope: !123)
!132 = !DILocation(line: 81, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !10, line: 81, column: 9)
!134 = !DILocation(line: 81, column: 14, scope: !133)
!135 = !DILocation(line: 81, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !10, line: 81, column: 9)
!137 = !DILocation(line: 81, column: 25, scope: !136)
!138 = !DILocation(line: 81, column: 23, scope: !136)
!139 = !DILocation(line: 81, column: 9, scope: !133)
!140 = !DILocation(line: 83, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !10, line: 82, column: 9)
!142 = !DILocation(line: 83, column: 28, scope: !141)
!143 = !DILocation(line: 83, column: 18, scope: !141)
!144 = !DILocation(line: 83, column: 13, scope: !141)
!145 = !DILocation(line: 83, column: 21, scope: !141)
!146 = !DILocation(line: 84, column: 9, scope: !141)
!147 = !DILocation(line: 81, column: 35, scope: !136)
!148 = !DILocation(line: 81, column: 9, scope: !136)
!149 = distinct !{!149, !139, !150, !76}
!150 = !DILocation(line: 84, column: 9, scope: !133)
!151 = !DILocation(line: 85, column: 9, scope: !123)
!152 = !DILocation(line: 85, column: 20, scope: !123)
!153 = !DILocation(line: 86, column: 19, scope: !123)
!154 = !DILocation(line: 86, column: 9, scope: !123)
!155 = !DILocation(line: 88, column: 1, scope: !104)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 91, type: !19, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", scope: !156, file: !10, line: 93, type: !22)
!158 = !DILocation(line: 93, column: 12, scope: !156)
!159 = !DILocalVariable(name: "dataBuffer", scope: !156, file: !10, line: 94, type: !26)
!160 = !DILocation(line: 94, column: 10, scope: !156)
!161 = !DILocation(line: 95, column: 12, scope: !156)
!162 = !DILocation(line: 95, column: 10, scope: !156)
!163 = !DILocation(line: 96, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !10, line: 96, column: 8)
!165 = !DILocation(line: 96, column: 8, scope: !156)
!166 = !DILocation(line: 99, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !10, line: 97, column: 5)
!168 = !DILocation(line: 99, column: 9, scope: !167)
!169 = !DILocation(line: 100, column: 9, scope: !167)
!170 = !DILocation(line: 100, column: 20, scope: !167)
!171 = !DILocation(line: 101, column: 5, scope: !167)
!172 = !DILocalVariable(name: "dest", scope: !173, file: !10, line: 103, type: !43)
!173 = distinct !DILexicalBlock(scope: !156, file: !10, line: 102, column: 5)
!174 = !DILocation(line: 103, column: 14, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !173, file: !10, line: 104, type: !48)
!176 = !DILocation(line: 104, column: 16, scope: !173)
!177 = !DILocalVariable(name: "dataLen", scope: !173, file: !10, line: 104, type: !48)
!178 = !DILocation(line: 104, column: 19, scope: !173)
!179 = !DILocation(line: 105, column: 26, scope: !173)
!180 = !DILocation(line: 105, column: 19, scope: !173)
!181 = !DILocation(line: 105, column: 17, scope: !173)
!182 = !DILocation(line: 107, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !173, file: !10, line: 107, column: 9)
!184 = !DILocation(line: 107, column: 14, scope: !183)
!185 = !DILocation(line: 107, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !10, line: 107, column: 9)
!187 = !DILocation(line: 107, column: 25, scope: !186)
!188 = !DILocation(line: 107, column: 23, scope: !186)
!189 = !DILocation(line: 107, column: 9, scope: !183)
!190 = !DILocation(line: 109, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !10, line: 108, column: 9)
!192 = !DILocation(line: 109, column: 28, scope: !191)
!193 = !DILocation(line: 109, column: 18, scope: !191)
!194 = !DILocation(line: 109, column: 13, scope: !191)
!195 = !DILocation(line: 109, column: 21, scope: !191)
!196 = !DILocation(line: 110, column: 9, scope: !191)
!197 = !DILocation(line: 107, column: 35, scope: !186)
!198 = !DILocation(line: 107, column: 9, scope: !186)
!199 = distinct !{!199, !189, !200, !76}
!200 = !DILocation(line: 110, column: 9, scope: !183)
!201 = !DILocation(line: 111, column: 9, scope: !173)
!202 = !DILocation(line: 111, column: 20, scope: !173)
!203 = !DILocation(line: 112, column: 19, scope: !173)
!204 = !DILocation(line: 112, column: 9, scope: !173)
!205 = !DILocation(line: 114, column: 1, scope: !156)
