; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01_bad.source to i8*), i64 44, i1 false), !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !39
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !40
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !41
  %add = add i64 %call, 1, !dbg !42
  %call3 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 %add) #7, !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %3), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #7, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #7, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !77
  store i32* %arraydecay, i32** %data, align 8, !dbg !78
  %0 = load i32*, i32** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !83
  %2 = load i32*, i32** %data, align 8, !dbg !84
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !85
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !86
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !87
  %add = add i64 %call, 1, !dbg !88
  %call3 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 %add) #7, !dbg !89
  %3 = load i32*, i32** %data, align 8, !dbg !90
  call void @printWLine(i32* %3), !dbg !91
  ret void, !dbg !92
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 35, column: 12, scope: !11)
!32 = !DILocation(line: 35, column: 10, scope: !11)
!33 = !DILocation(line: 36, column: 5, scope: !11)
!34 = !DILocation(line: 36, column: 13, scope: !11)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 38, type: !27)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!37 = !DILocation(line: 38, column: 17, scope: !36)
!38 = !DILocation(line: 41, column: 17, scope: !36)
!39 = !DILocation(line: 41, column: 23, scope: !36)
!40 = !DILocation(line: 41, column: 38, scope: !36)
!41 = !DILocation(line: 41, column: 31, scope: !36)
!42 = !DILocation(line: 41, column: 46, scope: !36)
!43 = !DILocation(line: 41, column: 9, scope: !36)
!44 = !DILocation(line: 42, column: 20, scope: !36)
!45 = !DILocation(line: 42, column: 9, scope: !36)
!46 = !DILocation(line: 44, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_01_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 71, column: 5, scope: !47)
!49 = !DILocation(line: 72, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 84, type: !51, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!19, !19, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 84, type: !19)
!57 = !DILocation(line: 84, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 84, type: !53)
!59 = !DILocation(line: 84, column: 27, scope: !50)
!60 = !DILocation(line: 87, column: 22, scope: !50)
!61 = !DILocation(line: 87, column: 12, scope: !50)
!62 = !DILocation(line: 87, column: 5, scope: !50)
!63 = !DILocation(line: 89, column: 5, scope: !50)
!64 = !DILocation(line: 90, column: 5, scope: !50)
!65 = !DILocation(line: 91, column: 5, scope: !50)
!66 = !DILocation(line: 94, column: 5, scope: !50)
!67 = !DILocation(line: 95, column: 5, scope: !50)
!68 = !DILocation(line: 96, column: 5, scope: !50)
!69 = !DILocation(line: 98, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 53, type: !16)
!72 = !DILocation(line: 53, column: 15, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 54, type: !22)
!74 = !DILocation(line: 54, column: 13, scope: !70)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 55, type: !27)
!76 = !DILocation(line: 55, column: 13, scope: !70)
!77 = !DILocation(line: 58, column: 12, scope: !70)
!78 = !DILocation(line: 58, column: 10, scope: !70)
!79 = !DILocation(line: 59, column: 5, scope: !70)
!80 = !DILocation(line: 59, column: 13, scope: !70)
!81 = !DILocalVariable(name: "source", scope: !82, file: !12, line: 61, type: !27)
!82 = distinct !DILexicalBlock(scope: !70, file: !12, line: 60, column: 5)
!83 = !DILocation(line: 61, column: 17, scope: !82)
!84 = !DILocation(line: 64, column: 17, scope: !82)
!85 = !DILocation(line: 64, column: 23, scope: !82)
!86 = !DILocation(line: 64, column: 38, scope: !82)
!87 = !DILocation(line: 64, column: 31, scope: !82)
!88 = !DILocation(line: 64, column: 46, scope: !82)
!89 = !DILocation(line: 64, column: 9, scope: !82)
!90 = !DILocation(line: 65, column: 20, scope: !82)
!91 = !DILocation(line: 65, column: 9, scope: !82)
!92 = !DILocation(line: 67, column: 1, scope: !70)
