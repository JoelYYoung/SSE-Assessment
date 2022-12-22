; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15_bad() #0 !dbg !11 {
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
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !41, metadata !DIExpression()), !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  %call = call i64 @strlen(i8* %3) #6, !dbg !44
  store i64 %call, i64* %dataLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !49
  %5 = load i64, i64* %dataLen, align 8, !dbg !51
  %cmp = icmp ult i64 %4, %5, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !54
  %7 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !54
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !54
  %9 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !58
  store i8 %8, i8* %arrayidx2, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %10, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !66
  store i8 0, i8* %arrayidx3, align 1, !dbg !67
  %11 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %11), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !99
  store i8* %arraydecay, i8** %data, align 8, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !102
  %1 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !110, metadata !DIExpression()), !dbg !111
  %3 = load i8*, i8** %data, align 8, !dbg !112
  %call = call i64 @strlen(i8* %3) #6, !dbg !113
  store i64 %call, i64* %dataLen, align 8, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !118
  %5 = load i64, i64* %dataLen, align 8, !dbg !120
  %cmp = icmp ult i64 %4, %5, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !123
  %7 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !123
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !123
  %9 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !127
  store i8 %8, i8* %arrayidx2, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %10, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !134
  store i8 0, i8* %arrayidx3, align 1, !dbg !135
  %11 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %11), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !144
  store i8* %arraydecay, i8** %data, align 8, !dbg !145
  %0 = load i8*, i8** %data, align 8, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !147
  %1 = load i8*, i8** %data, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !150, metadata !DIExpression()), !dbg !152
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !155, metadata !DIExpression()), !dbg !156
  %3 = load i8*, i8** %data, align 8, !dbg !157
  %call = call i64 @strlen(i8* %3) #6, !dbg !158
  store i64 %call, i64* %dataLen, align 8, !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !163
  %5 = load i64, i64* %dataLen, align 8, !dbg !165
  %cmp = icmp ult i64 %4, %5, !dbg !166
  br i1 %cmp, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !168
  %7 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !168
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !168
  %9 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !172
  store i8 %8, i8* %arrayidx2, align 1, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %10, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !179
  store i8 0, i8* %arrayidx3, align 1, !dbg !180
  %11 = load i8*, i8** %data, align 8, !dbg !181
  call void @printLine(i8* %11), !dbg !182
  ret void, !dbg !183
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15.c", directory: "/root/SSE-Assessment")
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
!26 = !DILocation(line: 32, column: 16, scope: !11)
!27 = !DILocation(line: 32, column: 9, scope: !11)
!28 = !DILocation(line: 33, column: 9, scope: !11)
!29 = !DILocation(line: 33, column: 21, scope: !11)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 41, type: !32)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 41, column: 14, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !12, line: 42, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 42, column: 16, scope: !31)
!41 = !DILocalVariable(name: "dataLen", scope: !31, file: !12, line: 42, type: !37)
!42 = !DILocation(line: 42, column: 19, scope: !31)
!43 = !DILocation(line: 43, column: 26, scope: !31)
!44 = !DILocation(line: 43, column: 19, scope: !31)
!45 = !DILocation(line: 43, column: 17, scope: !31)
!46 = !DILocation(line: 45, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !31, file: !12, line: 45, column: 9)
!48 = !DILocation(line: 45, column: 14, scope: !47)
!49 = !DILocation(line: 45, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 45, column: 9)
!51 = !DILocation(line: 45, column: 25, scope: !50)
!52 = !DILocation(line: 45, column: 23, scope: !50)
!53 = !DILocation(line: 45, column: 9, scope: !47)
!54 = !DILocation(line: 47, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !12, line: 46, column: 9)
!56 = !DILocation(line: 47, column: 28, scope: !55)
!57 = !DILocation(line: 47, column: 18, scope: !55)
!58 = !DILocation(line: 47, column: 13, scope: !55)
!59 = !DILocation(line: 47, column: 21, scope: !55)
!60 = !DILocation(line: 48, column: 9, scope: !55)
!61 = !DILocation(line: 45, column: 35, scope: !50)
!62 = !DILocation(line: 45, column: 9, scope: !50)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 48, column: 9, scope: !47)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 49, column: 9, scope: !31)
!67 = !DILocation(line: 49, column: 20, scope: !31)
!68 = !DILocation(line: 50, column: 19, scope: !31)
!69 = !DILocation(line: 50, column: 9, scope: !31)
!70 = !DILocation(line: 52, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_15_good", scope: !12, file: !12, line: 122, type: !13, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 124, column: 5, scope: !71)
!73 = !DILocation(line: 125, column: 5, scope: !71)
!74 = !DILocation(line: 126, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 138, type: !76, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 138, type: !78)
!81 = !DILocation(line: 138, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 138, type: !79)
!83 = !DILocation(line: 138, column: 27, scope: !75)
!84 = !DILocation(line: 141, column: 22, scope: !75)
!85 = !DILocation(line: 141, column: 12, scope: !75)
!86 = !DILocation(line: 141, column: 5, scope: !75)
!87 = !DILocation(line: 143, column: 5, scope: !75)
!88 = !DILocation(line: 144, column: 5, scope: !75)
!89 = !DILocation(line: 145, column: 5, scope: !75)
!90 = !DILocation(line: 148, column: 5, scope: !75)
!91 = !DILocation(line: 149, column: 5, scope: !75)
!92 = !DILocation(line: 150, column: 5, scope: !75)
!93 = !DILocation(line: 152, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 61, type: !16)
!96 = !DILocation(line: 61, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !12, line: 62, type: !20)
!98 = !DILocation(line: 62, column: 10, scope: !94)
!99 = !DILocation(line: 63, column: 12, scope: !94)
!100 = !DILocation(line: 63, column: 10, scope: !94)
!101 = !DILocation(line: 72, column: 16, scope: !94)
!102 = !DILocation(line: 72, column: 9, scope: !94)
!103 = !DILocation(line: 73, column: 9, scope: !94)
!104 = !DILocation(line: 73, column: 20, scope: !94)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !12, line: 77, type: !32)
!106 = distinct !DILexicalBlock(scope: !94, file: !12, line: 76, column: 5)
!107 = !DILocation(line: 77, column: 14, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !106, file: !12, line: 78, type: !37)
!109 = !DILocation(line: 78, column: 16, scope: !106)
!110 = !DILocalVariable(name: "dataLen", scope: !106, file: !12, line: 78, type: !37)
!111 = !DILocation(line: 78, column: 19, scope: !106)
!112 = !DILocation(line: 79, column: 26, scope: !106)
!113 = !DILocation(line: 79, column: 19, scope: !106)
!114 = !DILocation(line: 79, column: 17, scope: !106)
!115 = !DILocation(line: 81, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !12, line: 81, column: 9)
!117 = !DILocation(line: 81, column: 14, scope: !116)
!118 = !DILocation(line: 81, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 81, column: 9)
!120 = !DILocation(line: 81, column: 25, scope: !119)
!121 = !DILocation(line: 81, column: 23, scope: !119)
!122 = !DILocation(line: 81, column: 9, scope: !116)
!123 = !DILocation(line: 83, column: 23, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !12, line: 82, column: 9)
!125 = !DILocation(line: 83, column: 28, scope: !124)
!126 = !DILocation(line: 83, column: 18, scope: !124)
!127 = !DILocation(line: 83, column: 13, scope: !124)
!128 = !DILocation(line: 83, column: 21, scope: !124)
!129 = !DILocation(line: 84, column: 9, scope: !124)
!130 = !DILocation(line: 81, column: 35, scope: !119)
!131 = !DILocation(line: 81, column: 9, scope: !119)
!132 = distinct !{!132, !122, !133, !65}
!133 = !DILocation(line: 84, column: 9, scope: !116)
!134 = !DILocation(line: 85, column: 9, scope: !106)
!135 = !DILocation(line: 85, column: 20, scope: !106)
!136 = !DILocation(line: 86, column: 19, scope: !106)
!137 = !DILocation(line: 86, column: 9, scope: !106)
!138 = !DILocation(line: 88, column: 1, scope: !94)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !12, line: 93, type: !16)
!141 = !DILocation(line: 93, column: 12, scope: !139)
!142 = !DILocalVariable(name: "dataBuffer", scope: !139, file: !12, line: 94, type: !20)
!143 = !DILocation(line: 94, column: 10, scope: !139)
!144 = !DILocation(line: 95, column: 12, scope: !139)
!145 = !DILocation(line: 95, column: 10, scope: !139)
!146 = !DILocation(line: 100, column: 16, scope: !139)
!147 = !DILocation(line: 100, column: 9, scope: !139)
!148 = !DILocation(line: 101, column: 9, scope: !139)
!149 = !DILocation(line: 101, column: 20, scope: !139)
!150 = !DILocalVariable(name: "dest", scope: !151, file: !12, line: 109, type: !32)
!151 = distinct !DILexicalBlock(scope: !139, file: !12, line: 108, column: 5)
!152 = !DILocation(line: 109, column: 14, scope: !151)
!153 = !DILocalVariable(name: "i", scope: !151, file: !12, line: 110, type: !37)
!154 = !DILocation(line: 110, column: 16, scope: !151)
!155 = !DILocalVariable(name: "dataLen", scope: !151, file: !12, line: 110, type: !37)
!156 = !DILocation(line: 110, column: 19, scope: !151)
!157 = !DILocation(line: 111, column: 26, scope: !151)
!158 = !DILocation(line: 111, column: 19, scope: !151)
!159 = !DILocation(line: 111, column: 17, scope: !151)
!160 = !DILocation(line: 113, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !151, file: !12, line: 113, column: 9)
!162 = !DILocation(line: 113, column: 14, scope: !161)
!163 = !DILocation(line: 113, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 113, column: 9)
!165 = !DILocation(line: 113, column: 25, scope: !164)
!166 = !DILocation(line: 113, column: 23, scope: !164)
!167 = !DILocation(line: 113, column: 9, scope: !161)
!168 = !DILocation(line: 115, column: 23, scope: !169)
!169 = distinct !DILexicalBlock(scope: !164, file: !12, line: 114, column: 9)
!170 = !DILocation(line: 115, column: 28, scope: !169)
!171 = !DILocation(line: 115, column: 18, scope: !169)
!172 = !DILocation(line: 115, column: 13, scope: !169)
!173 = !DILocation(line: 115, column: 21, scope: !169)
!174 = !DILocation(line: 116, column: 9, scope: !169)
!175 = !DILocation(line: 113, column: 35, scope: !164)
!176 = !DILocation(line: 113, column: 9, scope: !164)
!177 = distinct !{!177, !167, !178, !65}
!178 = !DILocation(line: 116, column: 9, scope: !161)
!179 = !DILocation(line: 117, column: 9, scope: !151)
!180 = !DILocation(line: 117, column: 20, scope: !151)
!181 = !DILocation(line: 118, column: 19, scope: !151)
!182 = !DILocation(line: 118, column: 9, scope: !151)
!183 = !DILocation(line: 120, column: 1, scope: !139)
