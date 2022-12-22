; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source1 = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  br label %source, !dbg !31

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !32), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source1, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [11 x i32]* %source1 to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad.source to i8*), i64 44, i1 false), !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  %3 = bitcast i32* %2 to i8*, !dbg !42
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !42
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !42
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !43
  %call = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !44
  %add = add i64 %call, 1, !dbg !45
  %mul = mul i64 %add, 4, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %5), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source1 = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  br label %source, !dbg !80

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !81), !dbg !82
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !83
  store i32* %arraydecay, i32** %data, align 8, !dbg !84
  %0 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata [11 x i32]* %source1, metadata !87, metadata !DIExpression()), !dbg !89
  %1 = bitcast [11 x i32]* %source1 to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !89
  %2 = load i32*, i32** %data, align 8, !dbg !90
  %3 = bitcast i32* %2 to i8*, !dbg !91
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !91
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !91
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !92
  %call = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !93
  %add = add i64 %call, 1, !dbg !94
  %mul = mul i64 %add, 4, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !96
  call void @printWLine(i32* %5), !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 33, column: 5, scope: !11)
!32 = !DILabel(scope: !11, name: "source", file: !12, line: 34)
!33 = !DILocation(line: 34, column: 1, scope: !11)
!34 = !DILocation(line: 37, column: 12, scope: !11)
!35 = !DILocation(line: 37, column: 10, scope: !11)
!36 = !DILocation(line: 38, column: 5, scope: !11)
!37 = !DILocation(line: 38, column: 13, scope: !11)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 40, type: !27)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!40 = !DILocation(line: 40, column: 17, scope: !39)
!41 = !DILocation(line: 43, column: 16, scope: !39)
!42 = !DILocation(line: 43, column: 9, scope: !39)
!43 = !DILocation(line: 43, column: 38, scope: !39)
!44 = !DILocation(line: 43, column: 31, scope: !39)
!45 = !DILocation(line: 43, column: 46, scope: !39)
!46 = !DILocation(line: 43, column: 51, scope: !39)
!47 = !DILocation(line: 44, column: 20, scope: !39)
!48 = !DILocation(line: 44, column: 9, scope: !39)
!49 = !DILocation(line: 46, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 75, column: 5, scope: !50)
!52 = !DILocation(line: 76, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !54, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 88, type: !19)
!60 = !DILocation(line: 88, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 88, type: !56)
!62 = !DILocation(line: 88, column: 27, scope: !53)
!63 = !DILocation(line: 91, column: 22, scope: !53)
!64 = !DILocation(line: 91, column: 12, scope: !53)
!65 = !DILocation(line: 91, column: 5, scope: !53)
!66 = !DILocation(line: 93, column: 5, scope: !53)
!67 = !DILocation(line: 94, column: 5, scope: !53)
!68 = !DILocation(line: 95, column: 5, scope: !53)
!69 = !DILocation(line: 98, column: 5, scope: !53)
!70 = !DILocation(line: 99, column: 5, scope: !53)
!71 = !DILocation(line: 100, column: 5, scope: !53)
!72 = !DILocation(line: 102, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 55, type: !16)
!75 = !DILocation(line: 55, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !12, line: 56, type: !22)
!77 = !DILocation(line: 56, column: 13, scope: !73)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !12, line: 57, type: !27)
!79 = !DILocation(line: 57, column: 13, scope: !73)
!80 = !DILocation(line: 58, column: 5, scope: !73)
!81 = !DILabel(scope: !73, name: "source", file: !12, line: 59)
!82 = !DILocation(line: 59, column: 1, scope: !73)
!83 = !DILocation(line: 62, column: 12, scope: !73)
!84 = !DILocation(line: 62, column: 10, scope: !73)
!85 = !DILocation(line: 63, column: 5, scope: !73)
!86 = !DILocation(line: 63, column: 13, scope: !73)
!87 = !DILocalVariable(name: "source", scope: !88, file: !12, line: 65, type: !27)
!88 = distinct !DILexicalBlock(scope: !73, file: !12, line: 64, column: 5)
!89 = !DILocation(line: 65, column: 17, scope: !88)
!90 = !DILocation(line: 68, column: 16, scope: !88)
!91 = !DILocation(line: 68, column: 9, scope: !88)
!92 = !DILocation(line: 68, column: 38, scope: !88)
!93 = !DILocation(line: 68, column: 31, scope: !88)
!94 = !DILocation(line: 68, column: 46, scope: !88)
!95 = !DILocation(line: 68, column: 51, scope: !88)
!96 = !DILocation(line: 69, column: 20, scope: !88)
!97 = !DILocation(line: 69, column: 9, scope: !88)
!98 = !DILocation(line: 71, column: 1, scope: !73)
