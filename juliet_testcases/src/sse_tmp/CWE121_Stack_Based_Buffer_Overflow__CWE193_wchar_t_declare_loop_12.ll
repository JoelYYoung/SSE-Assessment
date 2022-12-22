; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay1, i32** %data, align 8, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx2 = getelementptr inbounds i32, i32* %1, i64 0, !dbg !43
  store i32 0, i32* %arrayidx2, align 4, !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12_bad.source to i8*), i64 44, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call4 = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !55
  store i64 %call4, i64* %sourceLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !60
  %4 = load i64, i64* %sourceLen, align 8, !dbg !62
  %add = add i64 %4, 1, !dbg !63
  %cmp = icmp ult i64 %3, %add, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !68
  %6 = load i32, i32* %arrayidx5, align 4, !dbg !68
  %7 = load i32*, i32** %data, align 8, !dbg !69
  %8 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !69
  store i32 %6, i32* %arrayidx6, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %9, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %10), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
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
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i32* %arraydecay, i32** %data, align 8, !dbg !116
  %0 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  store i32* %arraydecay1, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds i32, i32* %1, i64 0, !dbg !123
  store i32 0, i32* %arrayidx2, align 4, !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !132
  %call4 = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !133
  store i64 %call4, i64* %sourceLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !138
  %4 = load i64, i64* %sourceLen, align 8, !dbg !140
  %add = add i64 %4, 1, !dbg !141
  %cmp = icmp ult i64 %3, %add, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !146
  %6 = load i32, i32* %arrayidx5, align 4, !dbg !146
  %7 = load i32*, i32** %data, align 8, !dbg !147
  %8 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !147
  store i32 %6, i32* %arrayidx6, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %9, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !155
  call void @printWLine(i32* %10), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 33, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!33 = !DILocation(line: 33, column: 8, scope: !11)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 34, column: 5)
!36 = !DILocation(line: 37, column: 14, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 17, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocation(line: 44, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !12, line: 41, column: 5)
!42 = !DILocation(line: 44, column: 14, scope: !41)
!43 = !DILocation(line: 45, column: 9, scope: !41)
!44 = !DILocation(line: 45, column: 17, scope: !41)
!45 = !DILocalVariable(name: "source", scope: !46, file: !12, line: 48, type: !27)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 5)
!47 = !DILocation(line: 48, column: 17, scope: !46)
!48 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 49, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 49, column: 16, scope: !46)
!52 = !DILocalVariable(name: "sourceLen", scope: !46, file: !12, line: 49, type: !49)
!53 = !DILocation(line: 49, column: 19, scope: !46)
!54 = !DILocation(line: 50, column: 28, scope: !46)
!55 = !DILocation(line: 50, column: 21, scope: !46)
!56 = !DILocation(line: 50, column: 19, scope: !46)
!57 = !DILocation(line: 53, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !46, file: !12, line: 53, column: 9)
!59 = !DILocation(line: 53, column: 14, scope: !58)
!60 = !DILocation(line: 53, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 53, column: 9)
!62 = !DILocation(line: 53, column: 25, scope: !61)
!63 = !DILocation(line: 53, column: 35, scope: !61)
!64 = !DILocation(line: 53, column: 23, scope: !61)
!65 = !DILocation(line: 53, column: 9, scope: !58)
!66 = !DILocation(line: 55, column: 30, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !12, line: 54, column: 9)
!68 = !DILocation(line: 55, column: 23, scope: !67)
!69 = !DILocation(line: 55, column: 13, scope: !67)
!70 = !DILocation(line: 55, column: 18, scope: !67)
!71 = !DILocation(line: 55, column: 21, scope: !67)
!72 = !DILocation(line: 56, column: 9, scope: !67)
!73 = !DILocation(line: 53, column: 41, scope: !61)
!74 = !DILocation(line: 53, column: 9, scope: !61)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 56, column: 9, scope: !58)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 57, column: 20, scope: !46)
!79 = !DILocation(line: 57, column: 9, scope: !46)
!80 = !DILocation(line: 59, column: 1, scope: !11)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_12_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 102, column: 5, scope: !81)
!83 = !DILocation(line: 103, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !85, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!19, !19, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 115, type: !19)
!91 = !DILocation(line: 115, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 115, type: !87)
!93 = !DILocation(line: 115, column: 27, scope: !84)
!94 = !DILocation(line: 118, column: 22, scope: !84)
!95 = !DILocation(line: 118, column: 12, scope: !84)
!96 = !DILocation(line: 118, column: 5, scope: !84)
!97 = !DILocation(line: 120, column: 5, scope: !84)
!98 = !DILocation(line: 121, column: 5, scope: !84)
!99 = !DILocation(line: 122, column: 5, scope: !84)
!100 = !DILocation(line: 125, column: 5, scope: !84)
!101 = !DILocation(line: 126, column: 5, scope: !84)
!102 = !DILocation(line: 127, column: 5, scope: !84)
!103 = !DILocation(line: 129, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 69, type: !16)
!106 = !DILocation(line: 69, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 70, type: !22)
!108 = !DILocation(line: 70, column: 13, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 71, type: !27)
!110 = !DILocation(line: 71, column: 13, scope: !104)
!111 = !DILocation(line: 72, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 72, column: 8)
!113 = !DILocation(line: 72, column: 8, scope: !104)
!114 = !DILocation(line: 76, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 73, column: 5)
!116 = !DILocation(line: 76, column: 14, scope: !115)
!117 = !DILocation(line: 77, column: 9, scope: !115)
!118 = !DILocation(line: 77, column: 17, scope: !115)
!119 = !DILocation(line: 78, column: 5, scope: !115)
!120 = !DILocation(line: 83, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !112, file: !12, line: 80, column: 5)
!122 = !DILocation(line: 83, column: 14, scope: !121)
!123 = !DILocation(line: 84, column: 9, scope: !121)
!124 = !DILocation(line: 84, column: 17, scope: !121)
!125 = !DILocalVariable(name: "source", scope: !126, file: !12, line: 87, type: !27)
!126 = distinct !DILexicalBlock(scope: !104, file: !12, line: 86, column: 5)
!127 = !DILocation(line: 87, column: 17, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 88, type: !49)
!129 = !DILocation(line: 88, column: 16, scope: !126)
!130 = !DILocalVariable(name: "sourceLen", scope: !126, file: !12, line: 88, type: !49)
!131 = !DILocation(line: 88, column: 19, scope: !126)
!132 = !DILocation(line: 89, column: 28, scope: !126)
!133 = !DILocation(line: 89, column: 21, scope: !126)
!134 = !DILocation(line: 89, column: 19, scope: !126)
!135 = !DILocation(line: 92, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !12, line: 92, column: 9)
!137 = !DILocation(line: 92, column: 14, scope: !136)
!138 = !DILocation(line: 92, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 92, column: 9)
!140 = !DILocation(line: 92, column: 25, scope: !139)
!141 = !DILocation(line: 92, column: 35, scope: !139)
!142 = !DILocation(line: 92, column: 23, scope: !139)
!143 = !DILocation(line: 92, column: 9, scope: !136)
!144 = !DILocation(line: 94, column: 30, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !12, line: 93, column: 9)
!146 = !DILocation(line: 94, column: 23, scope: !145)
!147 = !DILocation(line: 94, column: 13, scope: !145)
!148 = !DILocation(line: 94, column: 18, scope: !145)
!149 = !DILocation(line: 94, column: 21, scope: !145)
!150 = !DILocation(line: 95, column: 9, scope: !145)
!151 = !DILocation(line: 92, column: 41, scope: !139)
!152 = !DILocation(line: 92, column: 9, scope: !139)
!153 = distinct !{!153, !143, !154, !77}
!154 = !DILocation(line: 95, column: 9, scope: !136)
!155 = !DILocation(line: 96, column: 20, scope: !126)
!156 = !DILocation(line: 96, column: 9, scope: !126)
!157 = !DILocation(line: 98, column: 1, scope: !104)
