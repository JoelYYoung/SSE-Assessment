; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04_bad() #0 !dbg !11 {
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
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !29
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !43, metadata !DIExpression()), !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %call = call i64 @strlen(i8* %3) #6, !dbg !46
  store i64 %call, i64* %dataLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !51
  %5 = load i64, i64* %dataLen, align 8, !dbg !53
  %cmp = icmp ult i64 %4, %5, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !56
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !56
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !56
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !60
  store i8 %8, i8* %arrayidx2, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %10, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !68
  store i8 0, i8* %arrayidx3, align 1, !dbg !69
  %11 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* %11), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #7, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #7, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay, i8** %data, align 8, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !106
  %1 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !114, metadata !DIExpression()), !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %call = call i64 @strlen(i8* %3) #6, !dbg !117
  store i64 %call, i64* %dataLen, align 8, !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !122
  %5 = load i64, i64* %dataLen, align 8, !dbg !124
  %cmp = icmp ult i64 %4, %5, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !127
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !127
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !127
  %9 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !131
  store i8 %8, i8* %arrayidx2, align 1, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %10, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !138
  store i8 0, i8* %arrayidx3, align 1, !dbg !139
  %11 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* %11), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !148
  store i8* %arraydecay, i8** %data, align 8, !dbg !149
  %0 = load i8*, i8** %data, align 8, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !153
  %1 = load i8*, i8** %data, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !154
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !156, metadata !DIExpression()), !dbg !158
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !161, metadata !DIExpression()), !dbg !162
  %3 = load i8*, i8** %data, align 8, !dbg !163
  %call = call i64 @strlen(i8* %3) #6, !dbg !164
  store i64 %call, i64* %dataLen, align 8, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !169
  %5 = load i64, i64* %dataLen, align 8, !dbg !171
  %cmp = icmp ult i64 %4, %5, !dbg !172
  br i1 %cmp, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !174
  %7 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !174
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !174
  %9 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !178
  store i8 %8, i8* %arrayidx2, align 1, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %10, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !185
  store i8 0, i8* %arrayidx3, align 1, !dbg !186
  %11 = load i8*, i8** %data, align 8, !dbg !187
  call void @printLine(i8* %11), !dbg !188
  ret void, !dbg !189
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 32, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 33, column: 10, scope: !11)
!24 = !DILocation(line: 34, column: 12, scope: !11)
!25 = !DILocation(line: 34, column: 10, scope: !11)
!26 = !DILocation(line: 38, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !12, line: 36, column: 5)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 8)
!29 = !DILocation(line: 38, column: 9, scope: !27)
!30 = !DILocation(line: 39, column: 9, scope: !27)
!31 = !DILocation(line: 39, column: 21, scope: !27)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 42, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 42, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !12, line: 43, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 43, column: 16, scope: !33)
!43 = !DILocalVariable(name: "dataLen", scope: !33, file: !12, line: 43, type: !39)
!44 = !DILocation(line: 43, column: 19, scope: !33)
!45 = !DILocation(line: 44, column: 26, scope: !33)
!46 = !DILocation(line: 44, column: 19, scope: !33)
!47 = !DILocation(line: 44, column: 17, scope: !33)
!48 = !DILocation(line: 46, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !33, file: !12, line: 46, column: 9)
!50 = !DILocation(line: 46, column: 14, scope: !49)
!51 = !DILocation(line: 46, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 46, column: 9)
!53 = !DILocation(line: 46, column: 25, scope: !52)
!54 = !DILocation(line: 46, column: 23, scope: !52)
!55 = !DILocation(line: 46, column: 9, scope: !49)
!56 = !DILocation(line: 48, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 47, column: 9)
!58 = !DILocation(line: 48, column: 28, scope: !57)
!59 = !DILocation(line: 48, column: 18, scope: !57)
!60 = !DILocation(line: 48, column: 13, scope: !57)
!61 = !DILocation(line: 48, column: 21, scope: !57)
!62 = !DILocation(line: 49, column: 9, scope: !57)
!63 = !DILocation(line: 46, column: 35, scope: !52)
!64 = !DILocation(line: 46, column: 9, scope: !52)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 49, column: 9, scope: !49)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 50, column: 9, scope: !33)
!69 = !DILocation(line: 50, column: 20, scope: !33)
!70 = !DILocation(line: 51, column: 19, scope: !33)
!71 = !DILocation(line: 51, column: 9, scope: !33)
!72 = !DILocation(line: 53, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_04_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 118, column: 5, scope: !73)
!75 = !DILocation(line: 119, column: 5, scope: !73)
!76 = !DILocation(line: 120, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !78, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 132, type: !80)
!83 = !DILocation(line: 132, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 132, type: !81)
!85 = !DILocation(line: 132, column: 27, scope: !77)
!86 = !DILocation(line: 135, column: 22, scope: !77)
!87 = !DILocation(line: 135, column: 12, scope: !77)
!88 = !DILocation(line: 135, column: 5, scope: !77)
!89 = !DILocation(line: 137, column: 5, scope: !77)
!90 = !DILocation(line: 138, column: 5, scope: !77)
!91 = !DILocation(line: 139, column: 5, scope: !77)
!92 = !DILocation(line: 142, column: 5, scope: !77)
!93 = !DILocation(line: 143, column: 5, scope: !77)
!94 = !DILocation(line: 144, column: 5, scope: !77)
!95 = !DILocation(line: 146, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 62, type: !16)
!98 = !DILocation(line: 62, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !12, line: 63, type: !20)
!100 = !DILocation(line: 63, column: 10, scope: !96)
!101 = !DILocation(line: 64, column: 12, scope: !96)
!102 = !DILocation(line: 64, column: 10, scope: !96)
!103 = !DILocation(line: 73, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !12, line: 71, column: 5)
!105 = distinct !DILexicalBlock(scope: !96, file: !12, line: 65, column: 8)
!106 = !DILocation(line: 73, column: 9, scope: !104)
!107 = !DILocation(line: 74, column: 9, scope: !104)
!108 = !DILocation(line: 74, column: 20, scope: !104)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !12, line: 77, type: !34)
!110 = distinct !DILexicalBlock(scope: !96, file: !12, line: 76, column: 5)
!111 = !DILocation(line: 77, column: 14, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 78, type: !39)
!113 = !DILocation(line: 78, column: 16, scope: !110)
!114 = !DILocalVariable(name: "dataLen", scope: !110, file: !12, line: 78, type: !39)
!115 = !DILocation(line: 78, column: 19, scope: !110)
!116 = !DILocation(line: 79, column: 26, scope: !110)
!117 = !DILocation(line: 79, column: 19, scope: !110)
!118 = !DILocation(line: 79, column: 17, scope: !110)
!119 = !DILocation(line: 81, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !12, line: 81, column: 9)
!121 = !DILocation(line: 81, column: 14, scope: !120)
!122 = !DILocation(line: 81, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 81, column: 9)
!124 = !DILocation(line: 81, column: 25, scope: !123)
!125 = !DILocation(line: 81, column: 23, scope: !123)
!126 = !DILocation(line: 81, column: 9, scope: !120)
!127 = !DILocation(line: 83, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !12, line: 82, column: 9)
!129 = !DILocation(line: 83, column: 28, scope: !128)
!130 = !DILocation(line: 83, column: 18, scope: !128)
!131 = !DILocation(line: 83, column: 13, scope: !128)
!132 = !DILocation(line: 83, column: 21, scope: !128)
!133 = !DILocation(line: 84, column: 9, scope: !128)
!134 = !DILocation(line: 81, column: 35, scope: !123)
!135 = !DILocation(line: 81, column: 9, scope: !123)
!136 = distinct !{!136, !126, !137, !67}
!137 = !DILocation(line: 84, column: 9, scope: !120)
!138 = !DILocation(line: 85, column: 9, scope: !110)
!139 = !DILocation(line: 85, column: 20, scope: !110)
!140 = !DILocation(line: 86, column: 19, scope: !110)
!141 = !DILocation(line: 86, column: 9, scope: !110)
!142 = !DILocation(line: 88, column: 1, scope: !96)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 93, type: !16)
!145 = !DILocation(line: 93, column: 12, scope: !143)
!146 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !12, line: 94, type: !20)
!147 = !DILocation(line: 94, column: 10, scope: !143)
!148 = !DILocation(line: 95, column: 12, scope: !143)
!149 = !DILocation(line: 95, column: 10, scope: !143)
!150 = !DILocation(line: 99, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !12, line: 97, column: 5)
!152 = distinct !DILexicalBlock(scope: !143, file: !12, line: 96, column: 8)
!153 = !DILocation(line: 99, column: 9, scope: !151)
!154 = !DILocation(line: 100, column: 9, scope: !151)
!155 = !DILocation(line: 100, column: 20, scope: !151)
!156 = !DILocalVariable(name: "dest", scope: !157, file: !12, line: 103, type: !34)
!157 = distinct !DILexicalBlock(scope: !143, file: !12, line: 102, column: 5)
!158 = !DILocation(line: 103, column: 14, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 104, type: !39)
!160 = !DILocation(line: 104, column: 16, scope: !157)
!161 = !DILocalVariable(name: "dataLen", scope: !157, file: !12, line: 104, type: !39)
!162 = !DILocation(line: 104, column: 19, scope: !157)
!163 = !DILocation(line: 105, column: 26, scope: !157)
!164 = !DILocation(line: 105, column: 19, scope: !157)
!165 = !DILocation(line: 105, column: 17, scope: !157)
!166 = !DILocation(line: 107, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !157, file: !12, line: 107, column: 9)
!168 = !DILocation(line: 107, column: 14, scope: !167)
!169 = !DILocation(line: 107, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !12, line: 107, column: 9)
!171 = !DILocation(line: 107, column: 25, scope: !170)
!172 = !DILocation(line: 107, column: 23, scope: !170)
!173 = !DILocation(line: 107, column: 9, scope: !167)
!174 = !DILocation(line: 109, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !12, line: 108, column: 9)
!176 = !DILocation(line: 109, column: 28, scope: !175)
!177 = !DILocation(line: 109, column: 18, scope: !175)
!178 = !DILocation(line: 109, column: 13, scope: !175)
!179 = !DILocation(line: 109, column: 21, scope: !175)
!180 = !DILocation(line: 110, column: 9, scope: !175)
!181 = !DILocation(line: 107, column: 35, scope: !170)
!182 = !DILocation(line: 107, column: 9, scope: !170)
!183 = distinct !{!183, !173, !184, !67}
!184 = !DILocation(line: 110, column: 9, scope: !167)
!185 = !DILocation(line: 111, column: 9, scope: !157)
!186 = !DILocation(line: 111, column: 20, scope: !157)
!187 = !DILocation(line: 112, column: 19, scope: !157)
!188 = !DILocation(line: 112, column: 9, scope: !157)
!189 = !DILocation(line: 114, column: 1, scope: !143)
