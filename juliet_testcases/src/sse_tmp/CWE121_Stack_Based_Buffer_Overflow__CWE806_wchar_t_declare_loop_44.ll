; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  call void %2(i32* %3), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !53, metadata !DIExpression()), !dbg !54
  %1 = load i32*, i32** %data.addr, align 8, !dbg !55
  %call = call i64 @wcslen(i32* %1) #7, !dbg !56
  store i64 %call, i64* %dataLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !61
  %3 = load i64, i64* %dataLen, align 8, !dbg !63
  %cmp = icmp ult i64 %2, %3, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !66
  %5 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !66
  %6 = load i32, i32* %arrayidx, align 4, !dbg !66
  %7 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !70
  store i32 %6, i32* %arrayidx1, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %8, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !78
  store i32 0, i32* %arrayidx2, align 4, !dbg !79
  %9 = load i32*, i32** %data.addr, align 8, !dbg !80
  call void @printWLine(i32* %9), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #6, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #6, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !109, metadata !DIExpression()), !dbg !110
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %0 = load i32*, i32** %data, align 8, !dbg !115
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !119
  %3 = load i32*, i32** %data, align 8, !dbg !120
  call void %2(i32* %3), !dbg !119
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !122 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !130, metadata !DIExpression()), !dbg !131
  %1 = load i32*, i32** %data.addr, align 8, !dbg !132
  %call = call i64 @wcslen(i32* %1) #7, !dbg !133
  store i64 %call, i64* %dataLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !138
  %3 = load i64, i64* %dataLen, align 8, !dbg !140
  %cmp = icmp ult i64 %2, %3, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !143
  %5 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !143
  %6 = load i32, i32* %arrayidx, align 4, !dbg !143
  %7 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !147
  store i32 %6, i32* %arrayidx1, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %8, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !154
  store i32 0, i32* %arrayidx2, align 4, !dbg !155
  %9 = load i32*, i32** %data.addr, align 8, !dbg !156
  call void @printWLine(i32* %9), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44_bad", scope: !12, file: !12, line: 39, type: !13, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 41, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 41, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 43, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 43, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 44, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 44, column: 13, scope: !11)
!31 = !DILocation(line: 45, column: 12, scope: !11)
!32 = !DILocation(line: 45, column: 10, scope: !11)
!33 = !DILocation(line: 47, column: 13, scope: !11)
!34 = !DILocation(line: 47, column: 5, scope: !11)
!35 = !DILocation(line: 48, column: 5, scope: !11)
!36 = !DILocation(line: 48, column: 17, scope: !11)
!37 = !DILocation(line: 50, column: 5, scope: !11)
!38 = !DILocation(line: 50, column: 13, scope: !11)
!39 = !DILocation(line: 51, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !12, line: 23, type: !16)
!42 = !DILocation(line: 23, column: 31, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !12, line: 26, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 25, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 26, column: 17, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 27, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 27, column: 16, scope: !44)
!53 = !DILocalVariable(name: "dataLen", scope: !44, file: !12, line: 27, type: !50)
!54 = !DILocation(line: 27, column: 19, scope: !44)
!55 = !DILocation(line: 28, column: 26, scope: !44)
!56 = !DILocation(line: 28, column: 19, scope: !44)
!57 = !DILocation(line: 28, column: 17, scope: !44)
!58 = !DILocation(line: 30, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !44, file: !12, line: 30, column: 9)
!60 = !DILocation(line: 30, column: 14, scope: !59)
!61 = !DILocation(line: 30, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 30, column: 9)
!63 = !DILocation(line: 30, column: 25, scope: !62)
!64 = !DILocation(line: 30, column: 23, scope: !62)
!65 = !DILocation(line: 30, column: 9, scope: !59)
!66 = !DILocation(line: 32, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !12, line: 31, column: 9)
!68 = !DILocation(line: 32, column: 28, scope: !67)
!69 = !DILocation(line: 32, column: 18, scope: !67)
!70 = !DILocation(line: 32, column: 13, scope: !67)
!71 = !DILocation(line: 32, column: 21, scope: !67)
!72 = !DILocation(line: 33, column: 9, scope: !67)
!73 = !DILocation(line: 30, column: 35, scope: !62)
!74 = !DILocation(line: 30, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 33, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 34, column: 9, scope: !44)
!79 = !DILocation(line: 34, column: 20, scope: !44)
!80 = !DILocation(line: 35, column: 20, scope: !44)
!81 = !DILocation(line: 35, column: 9, scope: !44)
!82 = !DILocation(line: 37, column: 1, scope: !40)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_44_good", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 88, column: 5, scope: !83)
!85 = !DILocation(line: 89, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !87, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!19, !19, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !12, line: 100, type: !19)
!93 = !DILocation(line: 100, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !12, line: 100, type: !89)
!95 = !DILocation(line: 100, column: 27, scope: !86)
!96 = !DILocation(line: 103, column: 22, scope: !86)
!97 = !DILocation(line: 103, column: 12, scope: !86)
!98 = !DILocation(line: 103, column: 5, scope: !86)
!99 = !DILocation(line: 105, column: 5, scope: !86)
!100 = !DILocation(line: 106, column: 5, scope: !86)
!101 = !DILocation(line: 107, column: 5, scope: !86)
!102 = !DILocation(line: 110, column: 5, scope: !86)
!103 = !DILocation(line: 111, column: 5, scope: !86)
!104 = !DILocation(line: 112, column: 5, scope: !86)
!105 = !DILocation(line: 114, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 76, type: !16)
!108 = !DILocation(line: 76, column: 15, scope: !106)
!109 = !DILocalVariable(name: "funcPtr", scope: !106, file: !12, line: 77, type: !22)
!110 = !DILocation(line: 77, column: 12, scope: !106)
!111 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !12, line: 78, type: !27)
!112 = !DILocation(line: 78, column: 13, scope: !106)
!113 = !DILocation(line: 79, column: 12, scope: !106)
!114 = !DILocation(line: 79, column: 10, scope: !106)
!115 = !DILocation(line: 81, column: 13, scope: !106)
!116 = !DILocation(line: 81, column: 5, scope: !106)
!117 = !DILocation(line: 82, column: 5, scope: !106)
!118 = !DILocation(line: 82, column: 16, scope: !106)
!119 = !DILocation(line: 83, column: 5, scope: !106)
!120 = !DILocation(line: 83, column: 13, scope: !106)
!121 = !DILocation(line: 84, column: 1, scope: !106)
!122 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 58, type: !23, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", arg: 1, scope: !122, file: !12, line: 58, type: !16)
!124 = !DILocation(line: 58, column: 35, scope: !122)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !12, line: 61, type: !45)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 60, column: 5)
!127 = !DILocation(line: 61, column: 17, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 62, type: !50)
!129 = !DILocation(line: 62, column: 16, scope: !126)
!130 = !DILocalVariable(name: "dataLen", scope: !126, file: !12, line: 62, type: !50)
!131 = !DILocation(line: 62, column: 19, scope: !126)
!132 = !DILocation(line: 63, column: 26, scope: !126)
!133 = !DILocation(line: 63, column: 19, scope: !126)
!134 = !DILocation(line: 63, column: 17, scope: !126)
!135 = !DILocation(line: 65, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !12, line: 65, column: 9)
!137 = !DILocation(line: 65, column: 14, scope: !136)
!138 = !DILocation(line: 65, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 65, column: 9)
!140 = !DILocation(line: 65, column: 25, scope: !139)
!141 = !DILocation(line: 65, column: 23, scope: !139)
!142 = !DILocation(line: 65, column: 9, scope: !136)
!143 = !DILocation(line: 67, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !12, line: 66, column: 9)
!145 = !DILocation(line: 67, column: 28, scope: !144)
!146 = !DILocation(line: 67, column: 18, scope: !144)
!147 = !DILocation(line: 67, column: 13, scope: !144)
!148 = !DILocation(line: 67, column: 21, scope: !144)
!149 = !DILocation(line: 68, column: 9, scope: !144)
!150 = !DILocation(line: 65, column: 35, scope: !139)
!151 = !DILocation(line: 65, column: 9, scope: !139)
!152 = distinct !{!152, !142, !153, !77}
!153 = !DILocation(line: 68, column: 9, scope: !136)
!154 = !DILocation(line: 69, column: 9, scope: !126)
!155 = !DILocation(line: 69, column: 20, scope: !126)
!156 = !DILocation(line: 70, column: 20, scope: !126)
!157 = !DILocation(line: 70, column: 9, scope: !126)
!158 = !DILocation(line: 72, column: 1, scope: !122)
