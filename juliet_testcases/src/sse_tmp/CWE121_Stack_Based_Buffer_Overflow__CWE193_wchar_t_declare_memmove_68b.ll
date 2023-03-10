; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_badData = external dso_local global i32*, align 8
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_goodG2BData = external dso_local global i32*, align 8
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_badData, align 8, !dbg !19
  store i32* %0, i32** %data, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_badSink.source to i8*), i64 44, i1 false), !dbg !25
  %2 = load i32*, i32** %data, align 8, !dbg !26
  %3 = bitcast i32* %2 to i8*, !dbg !27
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !27
  %4 = bitcast i32* %arraydecay to i8*, !dbg !27
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !28
  %call = call i64 @wcslen(i32* %arraydecay1) #5, !dbg !29
  %add = add i64 %call, 1, !dbg !30
  %mul = mul i64 %add, 4, !dbg !31
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !27
  %5 = load i32*, i32** %data, align 8, !dbg !32
  call void @printWLine(i32* %5), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_goodG2BSink() #0 !dbg !35 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_goodG2BData, align 8, !dbg !38
  store i32* %0, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !41
  %2 = load i32*, i32** %data, align 8, !dbg !42
  %3 = bitcast i32* %2 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %4 = bitcast i32* %arraydecay to i8*, !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i64 @wcslen(i32* %arraydecay1) #5, !dbg !45
  %add = add i64 %call, 1, !dbg !46
  %mul = mul i64 %add, 4, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %5), !dbg !49
  ret void, !dbg !50
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 35, column: 15, scope: !9)
!19 = !DILocation(line: 35, column: 22, scope: !9)
!20 = !DILocalVariable(name: "source", scope: !21, file: !10, line: 37, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 352, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DILocation(line: 37, column: 17, scope: !21)
!26 = !DILocation(line: 40, column: 17, scope: !21)
!27 = !DILocation(line: 40, column: 9, scope: !21)
!28 = !DILocation(line: 40, column: 39, scope: !21)
!29 = !DILocation(line: 40, column: 32, scope: !21)
!30 = !DILocation(line: 40, column: 47, scope: !21)
!31 = !DILocation(line: 40, column: 52, scope: !21)
!32 = !DILocation(line: 41, column: 20, scope: !21)
!33 = !DILocation(line: 41, column: 9, scope: !21)
!34 = !DILocation(line: 43, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "data", scope: !35, file: !10, line: 52, type: !14)
!37 = !DILocation(line: 52, column: 15, scope: !35)
!38 = !DILocation(line: 52, column: 22, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 54, type: !22)
!40 = distinct !DILexicalBlock(scope: !35, file: !10, line: 53, column: 5)
!41 = !DILocation(line: 54, column: 17, scope: !40)
!42 = !DILocation(line: 57, column: 17, scope: !40)
!43 = !DILocation(line: 57, column: 9, scope: !40)
!44 = !DILocation(line: 57, column: 39, scope: !40)
!45 = !DILocation(line: 57, column: 32, scope: !40)
!46 = !DILocation(line: 57, column: 47, scope: !40)
!47 = !DILocation(line: 57, column: 52, scope: !40)
!48 = !DILocation(line: 58, column: 20, scope: !40)
!49 = !DILocation(line: 58, column: 9, scope: !40)
!50 = !DILocation(line: 60, column: 1, scope: !35)
