; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %1, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %2, i32** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !46
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx3, align 4, !dbg !48
  %3 = load i32*, i32** %data1, align 8, !dbg !49
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call5 = call i32* @wcscpy(i32* %3, i32* %arraydecay4) #4, !dbg !51
  %4 = load i32*, i32** %data1, align 8, !dbg !52
  call void @printWLine(i32* %4), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #4, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #4, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !85
  store i32* %arraydecay, i32** %data, align 8, !dbg !86
  %0 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !89, metadata !DIExpression()), !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %1, i32** %dataCopy, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !93, metadata !DIExpression()), !dbg !94
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !95
  store i32* %2, i32** %data1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !99
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !100
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx3, align 4, !dbg !102
  %3 = load i32*, i32** %data1, align 8, !dbg !103
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call5 = call i32* @wcscpy(i32* %3, i32* %arraydecay4) #4, !dbg !105
  %4 = load i32*, i32** %data1, align 8, !dbg !106
  call void @printWLine(i32* %4), !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 30, column: 12, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 13, scope: !11)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !12, line: 33, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!37 = !DILocation(line: 33, column: 19, scope: !36)
!38 = !DILocation(line: 33, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 34, type: !16)
!40 = !DILocation(line: 34, column: 19, scope: !36)
!41 = !DILocation(line: 34, column: 26, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 36, type: !27)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 35, column: 9)
!44 = !DILocation(line: 36, column: 21, scope: !43)
!45 = !DILocation(line: 37, column: 21, scope: !43)
!46 = !DILocation(line: 37, column: 13, scope: !43)
!47 = !DILocation(line: 38, column: 13, scope: !43)
!48 = !DILocation(line: 38, column: 27, scope: !43)
!49 = !DILocation(line: 40, column: 20, scope: !43)
!50 = !DILocation(line: 40, column: 26, scope: !43)
!51 = !DILocation(line: 40, column: 13, scope: !43)
!52 = !DILocation(line: 41, column: 24, scope: !43)
!53 = !DILocation(line: 41, column: 13, scope: !43)
!54 = !DILocation(line: 44, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_31_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 75, column: 5, scope: !55)
!57 = !DILocation(line: 76, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !59, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!19, !19, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 87, type: !19)
!65 = !DILocation(line: 87, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 87, type: !61)
!67 = !DILocation(line: 87, column: 27, scope: !58)
!68 = !DILocation(line: 90, column: 22, scope: !58)
!69 = !DILocation(line: 90, column: 12, scope: !58)
!70 = !DILocation(line: 90, column: 5, scope: !58)
!71 = !DILocation(line: 92, column: 5, scope: !58)
!72 = !DILocation(line: 93, column: 5, scope: !58)
!73 = !DILocation(line: 94, column: 5, scope: !58)
!74 = !DILocation(line: 97, column: 5, scope: !58)
!75 = !DILocation(line: 98, column: 5, scope: !58)
!76 = !DILocation(line: 99, column: 5, scope: !58)
!77 = !DILocation(line: 101, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 53, type: !16)
!80 = !DILocation(line: 53, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 54, type: !22)
!82 = !DILocation(line: 54, column: 13, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 55, type: !27)
!84 = !DILocation(line: 55, column: 13, scope: !78)
!85 = !DILocation(line: 57, column: 12, scope: !78)
!86 = !DILocation(line: 57, column: 10, scope: !78)
!87 = !DILocation(line: 58, column: 5, scope: !78)
!88 = !DILocation(line: 58, column: 13, scope: !78)
!89 = !DILocalVariable(name: "dataCopy", scope: !90, file: !12, line: 60, type: !16)
!90 = distinct !DILexicalBlock(scope: !78, file: !12, line: 59, column: 5)
!91 = !DILocation(line: 60, column: 19, scope: !90)
!92 = !DILocation(line: 60, column: 30, scope: !90)
!93 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 61, type: !16)
!94 = !DILocation(line: 61, column: 19, scope: !90)
!95 = !DILocation(line: 61, column: 26, scope: !90)
!96 = !DILocalVariable(name: "source", scope: !97, file: !12, line: 63, type: !27)
!97 = distinct !DILexicalBlock(scope: !90, file: !12, line: 62, column: 9)
!98 = !DILocation(line: 63, column: 21, scope: !97)
!99 = !DILocation(line: 64, column: 21, scope: !97)
!100 = !DILocation(line: 64, column: 13, scope: !97)
!101 = !DILocation(line: 65, column: 13, scope: !97)
!102 = !DILocation(line: 65, column: 27, scope: !97)
!103 = !DILocation(line: 67, column: 20, scope: !97)
!104 = !DILocation(line: 67, column: 26, scope: !97)
!105 = !DILocation(line: 67, column: 13, scope: !97)
!106 = !DILocation(line: 68, column: 24, scope: !97)
!107 = !DILocation(line: 68, column: 13, scope: !97)
!108 = !DILocation(line: 71, column: 1, scope: !78)
