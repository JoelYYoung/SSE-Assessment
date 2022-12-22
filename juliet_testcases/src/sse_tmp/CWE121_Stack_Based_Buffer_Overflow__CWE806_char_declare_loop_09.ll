; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !46, metadata !DIExpression()), !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  %call = call i64 @strlen(i8* %4) #6, !dbg !49
  store i64 %call, i64* %dataLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !54
  %6 = load i64, i64* %dataLen, align 8, !dbg !56
  %cmp = icmp ult i64 %5, %6, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !59
  %8 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !59
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !59
  %10 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !63
  store i8 %9, i8* %arrayidx2, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %11, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !71
  store i8 0, i8* %arrayidx3, align 1, !dbg !72
  %12 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* %12), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !104
  store i8* %arraydecay, i8** %data, align 8, !dbg !105
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !106
  %tobool = icmp ne i32 %0, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !114
  %2 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !122, metadata !DIExpression()), !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %call = call i64 @strlen(i8* %4) #6, !dbg !125
  store i64 %call, i64* %dataLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !130
  %6 = load i64, i64* %dataLen, align 8, !dbg !132
  %cmp = icmp ult i64 %5, %6, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !135
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !135
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !135
  %10 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !139
  store i8 %9, i8* %arrayidx2, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %11, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !146
  store i8 0, i8* %arrayidx3, align 1, !dbg !147
  %12 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %12), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !156
  store i8* %arraydecay, i8** %data, align 8, !dbg !157
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !158
  %tobool = icmp ne i32 %0, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !163
  %2 = load i8*, i8** %data, align 8, !dbg !164
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !164
  store i8 0, i8* %arrayidx, align 1, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !167, metadata !DIExpression()), !dbg !169
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !172, metadata !DIExpression()), !dbg !173
  %4 = load i8*, i8** %data, align 8, !dbg !174
  %call = call i64 @strlen(i8* %4) #6, !dbg !175
  store i64 %call, i64* %dataLen, align 8, !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !180
  %6 = load i64, i64* %dataLen, align 8, !dbg !182
  %cmp = icmp ult i64 %5, %6, !dbg !183
  br i1 %cmp, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !185
  %8 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !185
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !185
  %10 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !189
  store i8 %9, i8* %arrayidx2, align 1, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %11, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !196
  store i8 0, i8* %arrayidx3, align 1, !dbg !197
  %12 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* %12), !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 8, scope: !11)
!29 = !DILocation(line: 31, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 31, column: 9, scope: !30)
!32 = !DILocation(line: 32, column: 9, scope: !30)
!33 = !DILocation(line: 32, column: 21, scope: !30)
!34 = !DILocation(line: 33, column: 5, scope: !30)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 36, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 16, scope: !36)
!46 = !DILocalVariable(name: "dataLen", scope: !36, file: !12, line: 36, type: !42)
!47 = !DILocation(line: 36, column: 19, scope: !36)
!48 = !DILocation(line: 37, column: 26, scope: !36)
!49 = !DILocation(line: 37, column: 19, scope: !36)
!50 = !DILocation(line: 37, column: 17, scope: !36)
!51 = !DILocation(line: 39, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !36, file: !12, line: 39, column: 9)
!53 = !DILocation(line: 39, column: 14, scope: !52)
!54 = !DILocation(line: 39, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 39, column: 9)
!56 = !DILocation(line: 39, column: 25, scope: !55)
!57 = !DILocation(line: 39, column: 23, scope: !55)
!58 = !DILocation(line: 39, column: 9, scope: !52)
!59 = !DILocation(line: 41, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !12, line: 40, column: 9)
!61 = !DILocation(line: 41, column: 28, scope: !60)
!62 = !DILocation(line: 41, column: 18, scope: !60)
!63 = !DILocation(line: 41, column: 13, scope: !60)
!64 = !DILocation(line: 41, column: 21, scope: !60)
!65 = !DILocation(line: 42, column: 9, scope: !60)
!66 = !DILocation(line: 39, column: 35, scope: !55)
!67 = !DILocation(line: 39, column: 9, scope: !55)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 42, column: 9, scope: !52)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 43, column: 9, scope: !36)
!72 = !DILocation(line: 43, column: 20, scope: !36)
!73 = !DILocation(line: 44, column: 19, scope: !36)
!74 = !DILocation(line: 44, column: 9, scope: !36)
!75 = !DILocation(line: 46, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_09_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 111, column: 5, scope: !76)
!78 = !DILocation(line: 112, column: 5, scope: !76)
!79 = !DILocation(line: 113, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !81, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 125, type: !83)
!86 = !DILocation(line: 125, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 125, type: !84)
!88 = !DILocation(line: 125, column: 27, scope: !80)
!89 = !DILocation(line: 128, column: 22, scope: !80)
!90 = !DILocation(line: 128, column: 12, scope: !80)
!91 = !DILocation(line: 128, column: 5, scope: !80)
!92 = !DILocation(line: 130, column: 5, scope: !80)
!93 = !DILocation(line: 131, column: 5, scope: !80)
!94 = !DILocation(line: 132, column: 5, scope: !80)
!95 = !DILocation(line: 135, column: 5, scope: !80)
!96 = !DILocation(line: 136, column: 5, scope: !80)
!97 = !DILocation(line: 137, column: 5, scope: !80)
!98 = !DILocation(line: 139, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 55, type: !16)
!101 = !DILocation(line: 55, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !12, line: 56, type: !20)
!103 = !DILocation(line: 56, column: 10, scope: !99)
!104 = !DILocation(line: 57, column: 12, scope: !99)
!105 = !DILocation(line: 57, column: 10, scope: !99)
!106 = !DILocation(line: 58, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !12, line: 58, column: 8)
!108 = !DILocation(line: 58, column: 8, scope: !99)
!109 = !DILocation(line: 61, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 59, column: 5)
!111 = !DILocation(line: 62, column: 5, scope: !110)
!112 = !DILocation(line: 66, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !12, line: 64, column: 5)
!114 = !DILocation(line: 66, column: 9, scope: !113)
!115 = !DILocation(line: 67, column: 9, scope: !113)
!116 = !DILocation(line: 67, column: 20, scope: !113)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !12, line: 70, type: !37)
!118 = distinct !DILexicalBlock(scope: !99, file: !12, line: 69, column: 5)
!119 = !DILocation(line: 70, column: 14, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !12, line: 71, type: !42)
!121 = !DILocation(line: 71, column: 16, scope: !118)
!122 = !DILocalVariable(name: "dataLen", scope: !118, file: !12, line: 71, type: !42)
!123 = !DILocation(line: 71, column: 19, scope: !118)
!124 = !DILocation(line: 72, column: 26, scope: !118)
!125 = !DILocation(line: 72, column: 19, scope: !118)
!126 = !DILocation(line: 72, column: 17, scope: !118)
!127 = !DILocation(line: 74, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !12, line: 74, column: 9)
!129 = !DILocation(line: 74, column: 14, scope: !128)
!130 = !DILocation(line: 74, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 74, column: 9)
!132 = !DILocation(line: 74, column: 25, scope: !131)
!133 = !DILocation(line: 74, column: 23, scope: !131)
!134 = !DILocation(line: 74, column: 9, scope: !128)
!135 = !DILocation(line: 76, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !12, line: 75, column: 9)
!137 = !DILocation(line: 76, column: 28, scope: !136)
!138 = !DILocation(line: 76, column: 18, scope: !136)
!139 = !DILocation(line: 76, column: 13, scope: !136)
!140 = !DILocation(line: 76, column: 21, scope: !136)
!141 = !DILocation(line: 77, column: 9, scope: !136)
!142 = !DILocation(line: 74, column: 35, scope: !131)
!143 = !DILocation(line: 74, column: 9, scope: !131)
!144 = distinct !{!144, !134, !145, !70}
!145 = !DILocation(line: 77, column: 9, scope: !128)
!146 = !DILocation(line: 78, column: 9, scope: !118)
!147 = !DILocation(line: 78, column: 20, scope: !118)
!148 = !DILocation(line: 79, column: 19, scope: !118)
!149 = !DILocation(line: 79, column: 9, scope: !118)
!150 = !DILocation(line: 81, column: 1, scope: !99)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !12, line: 86, type: !16)
!153 = !DILocation(line: 86, column: 12, scope: !151)
!154 = !DILocalVariable(name: "dataBuffer", scope: !151, file: !12, line: 87, type: !20)
!155 = !DILocation(line: 87, column: 10, scope: !151)
!156 = !DILocation(line: 88, column: 12, scope: !151)
!157 = !DILocation(line: 88, column: 10, scope: !151)
!158 = !DILocation(line: 89, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !12, line: 89, column: 8)
!160 = !DILocation(line: 89, column: 8, scope: !151)
!161 = !DILocation(line: 92, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 90, column: 5)
!163 = !DILocation(line: 92, column: 9, scope: !162)
!164 = !DILocation(line: 93, column: 9, scope: !162)
!165 = !DILocation(line: 93, column: 20, scope: !162)
!166 = !DILocation(line: 94, column: 5, scope: !162)
!167 = !DILocalVariable(name: "dest", scope: !168, file: !12, line: 96, type: !37)
!168 = distinct !DILexicalBlock(scope: !151, file: !12, line: 95, column: 5)
!169 = !DILocation(line: 96, column: 14, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !168, file: !12, line: 97, type: !42)
!171 = !DILocation(line: 97, column: 16, scope: !168)
!172 = !DILocalVariable(name: "dataLen", scope: !168, file: !12, line: 97, type: !42)
!173 = !DILocation(line: 97, column: 19, scope: !168)
!174 = !DILocation(line: 98, column: 26, scope: !168)
!175 = !DILocation(line: 98, column: 19, scope: !168)
!176 = !DILocation(line: 98, column: 17, scope: !168)
!177 = !DILocation(line: 100, column: 16, scope: !178)
!178 = distinct !DILexicalBlock(scope: !168, file: !12, line: 100, column: 9)
!179 = !DILocation(line: 100, column: 14, scope: !178)
!180 = !DILocation(line: 100, column: 21, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !12, line: 100, column: 9)
!182 = !DILocation(line: 100, column: 25, scope: !181)
!183 = !DILocation(line: 100, column: 23, scope: !181)
!184 = !DILocation(line: 100, column: 9, scope: !178)
!185 = !DILocation(line: 102, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !181, file: !12, line: 101, column: 9)
!187 = !DILocation(line: 102, column: 28, scope: !186)
!188 = !DILocation(line: 102, column: 18, scope: !186)
!189 = !DILocation(line: 102, column: 13, scope: !186)
!190 = !DILocation(line: 102, column: 21, scope: !186)
!191 = !DILocation(line: 103, column: 9, scope: !186)
!192 = !DILocation(line: 100, column: 35, scope: !181)
!193 = !DILocation(line: 100, column: 9, scope: !181)
!194 = distinct !{!194, !184, !195, !70}
!195 = !DILocation(line: 103, column: 9, scope: !178)
!196 = !DILocation(line: 104, column: 9, scope: !168)
!197 = !DILocation(line: 104, column: 20, scope: !168)
!198 = !DILocation(line: 105, column: 19, scope: !168)
!199 = !DILocation(line: 105, column: 9, scope: !168)
!200 = !DILocation(line: 107, column: 1, scope: !151)
