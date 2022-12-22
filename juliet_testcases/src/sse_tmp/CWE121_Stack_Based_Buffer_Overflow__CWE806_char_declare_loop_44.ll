; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  call void %2(i8* %3), !dbg !35
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %1 = load i8*, i8** %data.addr, align 8, !dbg !54
  %call = call i64 @strlen(i8* %1) #6, !dbg !55
  store i64 %call, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !60
  %3 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp = icmp ult i64 %2, %3, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !65
  %5 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !65
  %6 = load i8, i8* %arrayidx, align 1, !dbg !65
  %7 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !69
  store i8 %6, i8* %arrayidx1, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %8, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !77
  store i8 0, i8* %arrayidx2, align 1, !dbg !78
  %9 = load i8*, i8** %data.addr, align 8, !dbg !79
  call void @printLine(i8* %9), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !107, metadata !DIExpression()), !dbg !108
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !114
  %1 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !118
  call void %2(i8* %3), !dbg !117
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !120 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !128, metadata !DIExpression()), !dbg !129
  %1 = load i8*, i8** %data.addr, align 8, !dbg !130
  %call = call i64 @strlen(i8* %1) #6, !dbg !131
  store i64 %call, i64* %dataLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !136
  %3 = load i64, i64* %dataLen, align 8, !dbg !138
  %cmp = icmp ult i64 %2, %3, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !141
  %5 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !141
  %6 = load i8, i8* %arrayidx, align 1, !dbg !141
  %7 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !145
  store i8 %6, i8* %arrayidx1, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %8, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !152
  store i8 0, i8* %arrayidx2, align 1, !dbg !153
  %9 = load i8*, i8** %data.addr, align 8, !dbg !154
  call void @printLine(i8* %9), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44_bad", scope: !12, file: !12, line: 39, type: !13, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 41, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 41, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 43, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 43, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 44, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 44, column: 10, scope: !11)
!29 = !DILocation(line: 45, column: 12, scope: !11)
!30 = !DILocation(line: 45, column: 10, scope: !11)
!31 = !DILocation(line: 47, column: 12, scope: !11)
!32 = !DILocation(line: 47, column: 5, scope: !11)
!33 = !DILocation(line: 48, column: 5, scope: !11)
!34 = !DILocation(line: 48, column: 17, scope: !11)
!35 = !DILocation(line: 50, column: 5, scope: !11)
!36 = !DILocation(line: 50, column: 13, scope: !11)
!37 = !DILocation(line: 51, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !12, line: 23, type: !16)
!40 = !DILocation(line: 23, column: 28, scope: !38)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 26, type: !43)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 25, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 26, column: 14, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 27, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 27, column: 16, scope: !42)
!52 = !DILocalVariable(name: "dataLen", scope: !42, file: !12, line: 27, type: !48)
!53 = !DILocation(line: 27, column: 19, scope: !42)
!54 = !DILocation(line: 28, column: 26, scope: !42)
!55 = !DILocation(line: 28, column: 19, scope: !42)
!56 = !DILocation(line: 28, column: 17, scope: !42)
!57 = !DILocation(line: 30, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !42, file: !12, line: 30, column: 9)
!59 = !DILocation(line: 30, column: 14, scope: !58)
!60 = !DILocation(line: 30, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 30, column: 9)
!62 = !DILocation(line: 30, column: 25, scope: !61)
!63 = !DILocation(line: 30, column: 23, scope: !61)
!64 = !DILocation(line: 30, column: 9, scope: !58)
!65 = !DILocation(line: 32, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !12, line: 31, column: 9)
!67 = !DILocation(line: 32, column: 28, scope: !66)
!68 = !DILocation(line: 32, column: 18, scope: !66)
!69 = !DILocation(line: 32, column: 13, scope: !66)
!70 = !DILocation(line: 32, column: 21, scope: !66)
!71 = !DILocation(line: 33, column: 9, scope: !66)
!72 = !DILocation(line: 30, column: 35, scope: !61)
!73 = !DILocation(line: 30, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 33, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 34, column: 9, scope: !42)
!78 = !DILocation(line: 34, column: 20, scope: !42)
!79 = !DILocation(line: 35, column: 19, scope: !42)
!80 = !DILocation(line: 35, column: 9, scope: !42)
!81 = !DILocation(line: 37, column: 1, scope: !38)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_44_good", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 88, column: 5, scope: !82)
!84 = !DILocation(line: 89, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !86, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 100, type: !88)
!91 = !DILocation(line: 100, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 100, type: !89)
!93 = !DILocation(line: 100, column: 27, scope: !85)
!94 = !DILocation(line: 103, column: 22, scope: !85)
!95 = !DILocation(line: 103, column: 12, scope: !85)
!96 = !DILocation(line: 103, column: 5, scope: !85)
!97 = !DILocation(line: 105, column: 5, scope: !85)
!98 = !DILocation(line: 106, column: 5, scope: !85)
!99 = !DILocation(line: 107, column: 5, scope: !85)
!100 = !DILocation(line: 110, column: 5, scope: !85)
!101 = !DILocation(line: 111, column: 5, scope: !85)
!102 = !DILocation(line: 112, column: 5, scope: !85)
!103 = !DILocation(line: 114, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 76, type: !16)
!106 = !DILocation(line: 76, column: 12, scope: !104)
!107 = !DILocalVariable(name: "funcPtr", scope: !104, file: !12, line: 77, type: !20)
!108 = !DILocation(line: 77, column: 12, scope: !104)
!109 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !12, line: 78, type: !25)
!110 = !DILocation(line: 78, column: 10, scope: !104)
!111 = !DILocation(line: 79, column: 12, scope: !104)
!112 = !DILocation(line: 79, column: 10, scope: !104)
!113 = !DILocation(line: 81, column: 12, scope: !104)
!114 = !DILocation(line: 81, column: 5, scope: !104)
!115 = !DILocation(line: 82, column: 5, scope: !104)
!116 = !DILocation(line: 82, column: 16, scope: !104)
!117 = !DILocation(line: 83, column: 5, scope: !104)
!118 = !DILocation(line: 83, column: 13, scope: !104)
!119 = !DILocation(line: 84, column: 1, scope: !104)
!120 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 58, type: !21, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", arg: 1, scope: !120, file: !12, line: 58, type: !16)
!122 = !DILocation(line: 58, column: 32, scope: !120)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !12, line: 61, type: !43)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 60, column: 5)
!125 = !DILocation(line: 61, column: 14, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 62, type: !48)
!127 = !DILocation(line: 62, column: 16, scope: !124)
!128 = !DILocalVariable(name: "dataLen", scope: !124, file: !12, line: 62, type: !48)
!129 = !DILocation(line: 62, column: 19, scope: !124)
!130 = !DILocation(line: 63, column: 26, scope: !124)
!131 = !DILocation(line: 63, column: 19, scope: !124)
!132 = !DILocation(line: 63, column: 17, scope: !124)
!133 = !DILocation(line: 65, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !12, line: 65, column: 9)
!135 = !DILocation(line: 65, column: 14, scope: !134)
!136 = !DILocation(line: 65, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 65, column: 9)
!138 = !DILocation(line: 65, column: 25, scope: !137)
!139 = !DILocation(line: 65, column: 23, scope: !137)
!140 = !DILocation(line: 65, column: 9, scope: !134)
!141 = !DILocation(line: 67, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !12, line: 66, column: 9)
!143 = !DILocation(line: 67, column: 28, scope: !142)
!144 = !DILocation(line: 67, column: 18, scope: !142)
!145 = !DILocation(line: 67, column: 13, scope: !142)
!146 = !DILocation(line: 67, column: 21, scope: !142)
!147 = !DILocation(line: 68, column: 9, scope: !142)
!148 = !DILocation(line: 65, column: 35, scope: !137)
!149 = !DILocation(line: 65, column: 9, scope: !137)
!150 = distinct !{!150, !140, !151, !76}
!151 = !DILocation(line: 68, column: 9, scope: !134)
!152 = !DILocation(line: 69, column: 9, scope: !124)
!153 = !DILocation(line: 69, column: 20, scope: !124)
!154 = !DILocation(line: 70, column: 19, scope: !124)
!155 = !DILocation(line: 70, column: 9, scope: !124)
!156 = !DILocation(line: 72, column: 1, scope: !120)
