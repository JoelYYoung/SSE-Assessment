; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  br label %source, !dbg !28

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !29), !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %3 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #6, !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %5), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #6, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #6, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !77
  store i32* %arraydecay, i32** %data, align 8, !dbg !78
  br label %source, !dbg !79

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !80), !dbg !81
  %0 = load i32*, i32** %data, align 8, !dbg !82
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !88
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !89
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %call2 = call i64 @wcslen(i32* %3) #7, !dbg !91
  %4 = load i32*, i32** %data, align 8, !dbg !92
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %4) #6, !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* %5), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 32, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 32, column: 13, scope: !11)
!26 = !DILocation(line: 33, column: 12, scope: !11)
!27 = !DILocation(line: 33, column: 10, scope: !11)
!28 = !DILocation(line: 34, column: 5, scope: !11)
!29 = !DILabel(scope: !11, name: "source", file: !12, line: 35)
!30 = !DILocation(line: 35, column: 1, scope: !11)
!31 = !DILocation(line: 37, column: 13, scope: !11)
!32 = !DILocation(line: 37, column: 5, scope: !11)
!33 = !DILocation(line: 38, column: 5, scope: !11)
!34 = !DILocation(line: 38, column: 17, scope: !11)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 40, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 40, column: 17, scope: !36)
!41 = !DILocation(line: 42, column: 18, scope: !36)
!42 = !DILocation(line: 42, column: 31, scope: !36)
!43 = !DILocation(line: 42, column: 24, scope: !36)
!44 = !DILocation(line: 42, column: 45, scope: !36)
!45 = !DILocation(line: 42, column: 9, scope: !36)
!46 = !DILocation(line: 43, column: 20, scope: !36)
!47 = !DILocation(line: 43, column: 9, scope: !36)
!48 = !DILocation(line: 45, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_18_good", scope: !12, file: !12, line: 70, type: !13, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 72, column: 5, scope: !49)
!51 = !DILocation(line: 73, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !53, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!19, !19, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 85, type: !19)
!59 = !DILocation(line: 85, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 85, type: !55)
!61 = !DILocation(line: 85, column: 27, scope: !52)
!62 = !DILocation(line: 88, column: 22, scope: !52)
!63 = !DILocation(line: 88, column: 12, scope: !52)
!64 = !DILocation(line: 88, column: 5, scope: !52)
!65 = !DILocation(line: 90, column: 5, scope: !52)
!66 = !DILocation(line: 91, column: 5, scope: !52)
!67 = !DILocation(line: 92, column: 5, scope: !52)
!68 = !DILocation(line: 95, column: 5, scope: !52)
!69 = !DILocation(line: 96, column: 5, scope: !52)
!70 = !DILocation(line: 97, column: 5, scope: !52)
!71 = !DILocation(line: 99, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 54, type: !16)
!74 = !DILocation(line: 54, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !12, line: 55, type: !22)
!76 = !DILocation(line: 55, column: 13, scope: !72)
!77 = !DILocation(line: 56, column: 12, scope: !72)
!78 = !DILocation(line: 56, column: 10, scope: !72)
!79 = !DILocation(line: 57, column: 5, scope: !72)
!80 = !DILabel(scope: !72, name: "source", file: !12, line: 58)
!81 = !DILocation(line: 58, column: 1, scope: !72)
!82 = !DILocation(line: 60, column: 13, scope: !72)
!83 = !DILocation(line: 60, column: 5, scope: !72)
!84 = !DILocation(line: 61, column: 5, scope: !72)
!85 = !DILocation(line: 61, column: 16, scope: !72)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !12, line: 63, type: !37)
!87 = distinct !DILexicalBlock(scope: !72, file: !12, line: 62, column: 5)
!88 = !DILocation(line: 63, column: 17, scope: !87)
!89 = !DILocation(line: 65, column: 18, scope: !87)
!90 = !DILocation(line: 65, column: 31, scope: !87)
!91 = !DILocation(line: 65, column: 24, scope: !87)
!92 = !DILocation(line: 65, column: 45, scope: !87)
!93 = !DILocation(line: 65, column: 9, scope: !87)
!94 = !DILocation(line: 66, column: 20, scope: !87)
!95 = !DILocation(line: 66, column: 9, scope: !87)
!96 = !DILocation(line: 68, column: 1, scope: !72)
